#!/bin/bash
# vitals - Linux system resource monitor
#
# Samples CPU, memory, swap, real disk mounts, and load average on Linux.
# Default mode is a continuous colorized TUI; --once, --json, and --log
# are provided for cron, MOTD, and log pipelines.
#
# Depends only on GNU coreutils, gawk, and /proc. No jq/bc/ncurses.
# See --help for usage and environment overrides.

set -euo pipefail

# ============================ Configuration =================================

INTERVAL="${VITALS_INTERVAL:-2}"
CPU_THRESHOLD="${VITALS_CPU_THRESHOLD:-80}"
MEM_THRESHOLD="${VITALS_MEM_THRESHOLD:-80}"
DISK_THRESHOLD="${VITALS_DISK_THRESHOLD:-80}"
SWAP_THRESHOLD="${VITALS_SWAP_THRESHOLD:-70}"
WEBHOOK="${VITALS_WEBHOOK:-}"

MODE="watch"
LOG_FILE=""

# ============================ Argument parsing ==============================

usage() {
    cat <<'EOF'
vitals - Linux system resource monitor

Usage: vitals [--watch | --once | --json | --log FILE]
              [--interval SECS] [--cpu PCT] [--mem PCT]
              [--disk PCT] [--swap PCT] [--webhook URL] [--help]

Modes:
  (default), --watch   Continuous TUI loop (press q to quit).
  --once               Single sample, print and exit.
  --json               Single sample as JSON, print and exit.
  --log FILE           Append one sample per interval to FILE (no color,
                       no clearing). Useful with tail -f or log shippers.

Options:
  --interval SECS      Sample interval for --watch / --log  (default 2).
  --cpu PCT            CPU alert threshold                  (default 80).
  --mem PCT            Memory alert threshold               (default 80).
  --disk PCT           Disk alert threshold                 (default 80).
  --swap PCT           Swap alert threshold                 (default 70).
  --webhook URL        POST a JSON alert to URL on threshold breach.
  --help, -h           Show this help and exit.

Environment overrides (lower priority than flags):
  VITALS_INTERVAL, VITALS_CPU_THRESHOLD, VITALS_MEM_THRESHOLD,
  VITALS_DISK_THRESHOLD, VITALS_SWAP_THRESHOLD, VITALS_WEBHOOK
EOF
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --watch)    MODE="watch"; shift ;;
        --once)     MODE="once"; shift ;;
        --json)     MODE="json"; shift ;;
        --log)      MODE="log"
                    LOG_FILE="${2:?vitals: --log requires a FILE argument}"
                    shift 2 ;;
        --help|-h)  usage; exit 0 ;;
        --interval) INTERVAL="${2:?vitals: --interval requires a value}"; shift 2 ;;
        --cpu)      CPU_THRESHOLD="${2:?vitals: --cpu requires a value}"; shift 2 ;;
        --mem)      MEM_THRESHOLD="${2:?vitals: --mem requires a value}"; shift 2 ;;
        --disk)     DISK_THRESHOLD="${2:?vitals: --disk requires a value}"; shift 2 ;;
        --swap)     SWAP_THRESHOLD="${2:?vitals: --swap requires a value}"; shift 2 ;;
        --webhook)  WEBHOOK="${2:?vitals: --webhook requires a value}"; shift 2 ;;
        *)
            echo "vitals: unknown argument: $1" >&2
            echo "Try 'vitals --help' for usage." >&2
            exit 2
            ;;
    esac
done

for v in "$INTERVAL" "$CPU_THRESHOLD" "$MEM_THRESHOLD" "$DISK_THRESHOLD" "$SWAP_THRESHOLD"; do
    if ! [[ "$v" =~ ^[0-9]+$ ]]; then
        echo "vitals: numeric value required, got: $v" >&2
        exit 2
    fi
done

if [[ "$MODE" == "log" ]]; then
    if ! { : >> "$LOG_FILE"; } 2>/dev/null; then
        echo "vitals: cannot write to log file: $LOG_FILE" >&2
        exit 2
    fi
fi

# ============================ Color setup ===================================

# Colors disabled when stdout is not a TTY (piping) or in --log mode.
if [[ -t 1 && "$MODE" != "log" ]]; then
    C_GREEN=$(tput setaf 2 2>/dev/null || true)
    C_YELLOW=$(tput setaf 3 2>/dev/null || true)
    C_RED=$(tput setaf 1 2>/dev/null || true)
    C_BOLD=$(tput bold 2>/dev/null || true)
    C_DIM=$(tput dim 2>/dev/null || true)
    C_RESET=$(tput sgr0 2>/dev/null || true)
else
    C_GREEN="" C_YELLOW="" C_RED="" C_BOLD="" C_DIM="" C_RESET=""
fi

# ============================ Helpers =======================================

# Absolute color tiers: green < 60, yellow 60-79, red >= 80.
tier_color() {
    local pct="$1"
    if   (( pct >= 80 )); then printf '%s' "$C_RED"
    elif (( pct >= 60 )); then printf '%s' "$C_YELLOW"
    else                      printf '%s' "$C_GREEN"
    fi
}

# bar PCT [WIDTH] -> ASCII bar like [###.......]
bar() {
    local pct="$1" width="${2:-20}"
    local filled=$(( pct * width / 100 ))
    (( filled > width )) && filled=$width
    (( filled < 0 )) && filled=0
    local empty=$(( width - filled ))
    local hashes spaces
    printf -v hashes '%*s' "$filled" ''
    hashes=${hashes// /#}
    printf -v spaces '%*s' "$empty" ''
    spaces=${spaces// /·}
    printf '%s%s' "$hashes" "$spaces"
}

# ============================ Sampling ======================================

# CPU counters from /proc/stat, diffed against previous sample.
# State lives in globals because sampling runs across subshell boundaries
# when the watch loop renders; writing to globals here is the only way
# the previous counter survives the next sample.
_cpu_total_prev=-1
_cpu_idle_prev=-1

# Writes results to g_cpu (display) and g_cpu_pct (numeric, empty if unknown).
cpu_sample() {
    local vals total idle dt di pct
    vals=$(awk '/^cpu / {
        idle = $5 + $6
        total = 0
        for (i = 2; i <= NF; i++) total += $i
        printf "%d %d\n", total, idle
    }' /proc/stat)
    if [[ -z "$vals" ]]; then
        g_cpu="-"; g_cpu_pct=""
        return
    fi
    read -r total idle <<< "$vals"
    if (( _cpu_total_prev < 0 )); then
        _cpu_total_prev=$total
        _cpu_idle_prev=$idle
        g_cpu="-"; g_cpu_pct=""
        return
    fi
    dt=$(( total - _cpu_total_prev ))
    di=$(( idle - _cpu_idle_prev ))
    _cpu_total_prev=$total
    _cpu_idle_prev=$idle
    if (( dt <= 0 )); then
        g_cpu="0"; g_cpu_pct="0"
        return
    fi
    pct=$(( (dt - di) * 100 / dt ))
    g_cpu="$pct"; g_cpu_pct="$pct"
}

mem_sample() {
    # Output: "pct total_gb used_gb"
    awk '/^MemTotal:/     { t = $2 }
         /^MemAvailable:/ { a = $2 }
         END {
           if (t > 0) printf "%d %.1f %.1f\n", (t - a) * 100 / t, t / 1048576, (t - a) / 1048576
           else        printf "0 0.0 0.0\n"
         }' /proc/meminfo
}

swap_sample() {
    awk '/^SwapTotal:/ { t = $2 }
         /^SwapFree:/  { f = $2 }
         END {
           if (t > 0) {
             u = t - f
             printf "%d %.1f %.1f\n", u * 100 / t, t / 1048576, u / 1048576
           } else printf "0 0.0 0.0\n"
         }' /proc/meminfo
}

disk_sample() {
    # Output: one "mount pct" line per real filesystem, pseudo-fs excluded.
    df --output=pcent,target \
       --exclude-type=tmpfs \
       --exclude-type=devtmpfs \
       --exclude-type=squashfs 2>/dev/null \
        | awk 'NR > 1 {
            pct = $1; sub(/%/, "", pct)
            mount = $2
            if (mount != "") printf "%s %d\n", mount, pct
        }'
}

load_sample() {
    awk '{ print $1 }' /proc/loadavg
}

# ============================ Alerting ======================================

declare -A _alerted=()
ALERTS=()

send_alert() {
    local msg="$1"
    ALERTS+=("$msg")
    if [[ -n "$WEBHOOK" ]]; then
        local payload
        printf -v payload '{"text":"vitals: %s"}' "$msg"
        curl -s -X POST -H 'Content-type: application/json' \
             --data "$payload" "$WEBHOOK" >/dev/null 2>&1 || true
    fi
}

# Edge-triggered: fires only on rising transition across the threshold.
maybe_alert() {
    local name="$1" pct="$2" threshold="$3"
    if (( pct >= threshold )); then
        if [[ -z "${_alerted[$name]:-}" ]]; then
            _alerted[$name]=1
            send_alert "$name ${pct}% (threshold ${threshold}%)"
        fi
    else
        _alerted[$name]=""
    fi
}

# ============================ State and rendering ===========================

g_cpu="-"; g_cpu_pct=""
g_mem_pct=0 g_mem_total=0.0 g_mem_used=0.0
g_swap_pct=0 g_swap_total=0.0 g_swap_used=0.0
g_disk=""
g_load="0.00"

sample_all() {
    # cpu_sample writes to globals (it needs cross-call state).
    cpu_sample

    local mem swap
    mem=$(mem_sample)
    read -r g_mem_pct g_mem_total g_mem_used <<< "$mem"

    swap=$(swap_sample)
    read -r g_swap_pct g_swap_total g_swap_used <<< "$swap"

    g_disk=$(disk_sample)
    g_load=$(load_sample)
}

run_alerts() {
    ALERTS=()
    [[ "$g_cpu" != "-" ]] && maybe_alert "CPU" "$g_cpu_pct" "$CPU_THRESHOLD"
    maybe_alert "Memory" "$g_mem_pct" "$MEM_THRESHOLD"
    if [[ "$g_swap_total" != "0.0" ]]; then
        maybe_alert "Swap" "$g_swap_pct" "$SWAP_THRESHOLD"
    fi
    local mount pct
    while read -r mount pct; do
        [[ -z "$mount" ]] && continue
        maybe_alert "Disk:$mount" "$pct" "$DISK_THRESHOLD"
    done <<< "$g_disk"
}

# Build the human-readable frame into $FRAME.
build_frame() {
    local frame="" color b line
    local bar_w=20

    frame+="${C_BOLD}vitals${C_RESET} ${C_DIM}$(date '+%Y-%m-%d %H:%M:%S')${C_RESET}"$'\n'
    frame+=$'\n'

    if [[ "$g_cpu" == "-" ]]; then
        printf -v line '%-7s %s %5s     %s' "CPU" "$(bar 0 "$bar_w")" "—" "warming up"
    else
        color=$(tier_color "$g_cpu_pct")
        b=$(bar "$g_cpu_pct" "$bar_w")
        printf -v line '%-7s %s%s%s %3d%%' "CPU" "$color" "$b" "$C_RESET" "$g_cpu_pct"
    fi
    frame+="$line"$'\n'

    color=$(tier_color "$g_mem_pct")
    b=$(bar "$g_mem_pct" "$bar_w")
    printf -v line '%-7s %s%s%s %3d%%  %.1f / %.1f GB' \
        "Memory" "$color" "$b" "$C_RESET" "$g_mem_pct" "$g_mem_used" "$g_mem_total"
    frame+="$line"$'\n'

    if [[ "$g_swap_total" == "0.0" ]]; then
        printf -v line '%-7s %s %5s     %s' "Swap" "$(bar 0 "$bar_w")" "—" "no swap"
    else
        color=$(tier_color "$g_swap_pct")
        b=$(bar "$g_swap_pct" "$bar_w")
        printf -v line '%-7s %s%s%s %3d%%  %.1f / %.1f GB' \
            "Swap" "$color" "$b" "$C_RESET" "$g_swap_pct" "$g_swap_used" "$g_swap_total"
    fi
    frame+="$line"$'\n'

    local mount pct first=1 label
    while read -r mount pct; do
        [[ -z "$mount" ]] && continue
        color=$(tier_color "$pct")
        b=$(bar "$pct" "$bar_w")
        if (( first )); then label="Disk"; first=0; else label=""; fi
        printf -v line '%-7s %s%s%s %3d%%  %s' \
            "$label" "$color" "$b" "$C_RESET" "$pct" "$mount"
        frame+="$line"$'\n'
    done <<< "$g_disk"

    printf -v line '%-7s %s' "Load" "$g_load"
    frame+="$line"$'\n'

    if ((${#ALERTS[@]} > 0)); then
        frame+=$'\n'
        local a
        for a in "${ALERTS[@]}"; do
            frame+="${C_RED}! ${a}${C_RESET}"$'\n'
        done
    fi

    FRAME="$frame"
}

render_tui_frame() {
    # \033[H moves cursor home, \033[2J clears screen.
    printf '\033[H\033[2J%s' "$FRAME"
}

# ============================ Output modes ==================================

mode_once() {
    sample_all
    sleep 1
    sample_all
    run_alerts
    build_frame
    printf '%s\n' "$FRAME"
}

mode_json() {
    sample_all
    sleep 1
    sample_all
    run_alerts

    local cpu_val="${g_cpu_pct:-null}"
    [[ -z "$cpu_val" ]] && cpu_val="null"

    local disk_entries=() mount pct m_esc
    while read -r mount pct; do
        [[ -z "$mount" ]] && continue
        m_esc="${mount//\\/\\\\}"
        m_esc="${m_esc//\"/\\\"}"
        disk_entries+=("\"$m_esc\":$pct")
    done <<< "$g_disk"
    local disk_json=""
    if ((${#disk_entries[@]} > 0)); then
        disk_json=$(IFS=,; printf '%s' "${disk_entries[*]}")
    fi

    local alert_entries=() a a_esc
    if ((${#ALERTS[@]} > 0)); then
        for a in "${ALERTS[@]}"; do
            a_esc="${a//\\/\\\\}"
            a_esc="${a_esc//\"/\\\"}"
            alert_entries+=("\"$a_esc\"")
        done
    fi
    local alerts_json=""
    if ((${#alert_entries[@]} > 0)); then
        alerts_json=$(IFS=,; printf '%s' "${alert_entries[*]}")
    fi

    printf '{"cpu":%s,"mem":{"pct":%d,"used_gb":%.1f,"total_gb":%.1f},' \
        "$cpu_val" "$g_mem_pct" "$g_mem_used" "$g_mem_total"
    printf '"swap":{"pct":%d,"used_gb":%.1f,"total_gb":%.1f},' \
        "$g_swap_pct" "$g_swap_used" "$g_swap_total"
    printf '"disk":{%s},' "$disk_json"
    printf '"load":%s,' "$g_load"
    printf '"alerts":[%s]}\n' "$alerts_json"
}

mode_log() {
    # Warm-up sample (no log line).
    sample_all
    while true; do
        sleep "$INTERVAL"
        sample_all
        run_alerts
        local line
        printf -v line '%s cpu=%s mem=%d%% swap=%d%% load=%s' \
            "$(date '+%Y-%m-%dT%H:%M:%S%z')" \
            "${g_cpu_pct:--}" "$g_mem_pct" "$g_swap_pct" "$g_load"
        local mount pct
        while read -r mount pct; do
            [[ -z "$mount" ]] && continue
            line+=" disk:${mount}=${pct}%"
        done <<< "$g_disk"
        if ((${#ALERTS[@]} > 0)); then
            line+=" alerts=\"${ALERTS[*]}\""
        fi
        printf '%s\n' "$line" >> "$LOG_FILE"
    done
}

# ============================ Cleanup and main ==============================

_in_alt_screen=0
_cleaned=0

cleanup() {
    (( _cleaned )) && return
    _cleaned=1
    printf '%s' "$C_RESET"
    if (( _in_alt_screen )); then
        tput rmcup 2>/dev/null || true
        tput cnorm 2>/dev/null || true
        _in_alt_screen=0
        printf '\n'
    fi
}
trap cleanup EXIT
trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

mode_watch() {
    # q-to-quit only works when stdin is an interactive TTY. Otherwise
    # (cron, pipe, /dev/null) read -t would return immediately on EOF
    # and busy-loop; fall back to plain sleep in that case.
    local use_read_for_quit=0
    if [[ -t 0 && -t 1 ]]; then
        use_read_for_quit=1
        tput smcup 2>/dev/null || true
        tput civis 2>/dev/null || true
        _in_alt_screen=1
    fi

    # Warm-up sample then first render so the user sees a frame immediately.
    sample_all
    run_alerts
    build_frame
    render_tui_frame

    local key=""
    while true; do
        if (( use_read_for_quit )); then
            key=""
            if IFS= read -t "$INTERVAL" -rsn1 key; then
                case "$key" in
                    q|Q) break ;;
                    *)   continue ;;
                esac
            fi
        else
            sleep "$INTERVAL"
        fi
        sample_all
        run_alerts
        build_frame
        render_tui_frame
    done
}

case "$MODE" in
    watch) mode_watch ;;
    once)  mode_once ;;
    json)  mode_json ;;
    log)   mode_log ;;
esac
