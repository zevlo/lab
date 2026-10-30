#!/usr/bin/env bash

set -u
export LC_ALL=C

CPU_THRESHOLD=80
MEMORY_THRESHOLD=80
DISK_THRESHOLD=80
INTERVAL=2
CPU_SAMPLE_GAP=1
ALERT_COOLDOWN=60
LOG_MAX_BYTES=1048576
LOG_FILE="${XDG_STATE_HOME:-$HOME/.local/state}/sysmonitor.log"
LOG_ENABLED=1
USE_COLOR=1
TTY=0
RUN_ONCE=0

usage() {
  cat <<EOF
Usage: ${0##*/} [options]

Monitor CPU, memory, and disk usage. Linux only.

Options:
  -c PCT       CPU alert threshold, 0-100 (default 80)
  -m PCT       memory alert threshold, 0-100 (default 80)
  -d PCT       disk alert threshold, 0-100 (default 80)
  -i SEC       sampling interval in seconds (default 2)
  -l FILE      log file path (default: $LOG_FILE)
  -o, --once   sample once and exit (cron-friendly)
  -n, --no-color
  -h, --help   show this help
EOF
}

die() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

while (( $# )); do
  case $1 in
    --once) RUN_ONCE=1 ;;
    --no-color) USE_COLOR=0 ;;
    --help) usage; exit 0 ;;
    --) shift; break ;;
    *) break ;;
  esac
  shift
done

while getopts ":c:m:d:i:l:onh" opt; do
  case $opt in
    c) CPU_THRESHOLD=$OPTARG ;;
    m) MEMORY_THRESHOLD=$OPTARG ;;
    d) DISK_THRESHOLD=$OPTARG ;;
    i) INTERVAL=$OPTARG ;;
    l) LOG_FILE=$OPTARG ;;
    o) RUN_ONCE=1 ;;
    n) USE_COLOR=0 ;;
    h) usage; exit 0 ;;
    :) die "option -$OPTARG requires an argument" ;;
    ?) die "invalid option: -$OPTARG" ;;
  esac
done

valid_pct() {
  [[ $1 =~ ^[0-9]+$ ]] && (( 10#$1 >= 0 && 10#$1 <= 100 ))
}

valid_pct "$CPU_THRESHOLD" || die "CPU threshold must be an integer 0-100"
valid_pct "$MEMORY_THRESHOLD" || die "memory threshold must be an integer 0-100"
valid_pct "$DISK_THRESHOLD" || die "disk threshold must be an integer 0-100"
[[ $INTERVAL =~ ^[1-9][0-9]*$ ]] || die "interval must be a positive integer"

[[ -r /proc/stat ]] || die "/proc/stat not readable; this script requires Linux"
[[ -r /proc/meminfo ]] || die "/proc/meminfo not readable; this script requires Linux"
command -v awk >/dev/null 2>&1 || die "awk not found"
command -v df >/dev/null 2>&1 || die "df not found"

RED=""
RESET=""
if (( USE_COLOR )) && [[ -t 1 ]]; then
  TTY=1
  RED=$(tput setaf 1 2>/dev/null)
  RESET=$(tput sgr0 2>/dev/null)
elif [[ -t 1 ]]; then
  TTY=1
fi

LOG_DIR=$(dirname -- "$LOG_FILE")
mkdir -p -- "$LOG_DIR" 2>/dev/null || die "cannot create log directory: $LOG_DIR"

trap 'exit 0' INT TERM

read_cpu_sample() {
  awk 'NR==1 && $1=="cpu" {print $2, $3, $4, $5, $6, $7, $8; exit}' "${1:-/proc/stat}" 2>/dev/null
}

cpu_pct() {
  awk -v prev="$1" -v cur="$2" 'BEGIN {
    split(prev, p, " ")
    split(cur, c, " ")
    if (p[8] == "" || c[8] == "") exit 1
    pt = 0
    ct = 0
    for (i = 1; i <= 8; i++) { pt += p[i]; ct += c[i] }
    pd = p[4] + p[5]
    cd = c[4] + c[5]
    td = ct - pt
    id = cd - pd
    if (td <= 0) exit 1
    printf "%d", (td - id) * 100 / td
  }'
}

memory_usage() {
  awk '
    /^MemTotal:/     { t = $2 }
    /^MemFree:/      { f = $2 }
    /^Buffers:/      { b = $2 }
    /^Cached:/       { c = $2 }
    /^MemAvailable:/ { a = $2 }
    END {
      if (t == "" || t + 0 <= 0) exit 1
      if (a == "") a = f + b + c
      if (a == "" || a < 0) exit 1
      printf "%d", (t - a) * 100 / t
    }' "${1:-/proc/meminfo}" 2>/dev/null
}

disk_usage() {
  df -P "${1:-/}" 2>/dev/null | awk 'NR==2 {
    u = $(NF-1)
    sub(/%$/, "", u)
    if (u !~ /^[0-9]+$/) exit 1
    print u
  }'
}

declare -A LAST_ALERT

alert() {
  printf '%sALERT: %s usage exceeded threshold! Current value: %s%%%s\n' "$RED" "$1" "$2" "$RESET"
}

check_threshold() {
  local name=$1 value=$2 threshold=$3 now
  (( value >= threshold )) || return 0
  now=$(date +%s)
  if (( ${LAST_ALERT[$name]:-0} + ALERT_COOLDOWN <= now )); then
    LAST_ALERT[$name]=$now
    alert "$name" "$value"
  fi
}

show_status() {
  if (( TTY )) && (( ! RUN_ONCE )); then
    clear
  fi
  printf 'Resource Usage:\nCPU: %s%%\nMemory: %s%%\nDisk: %s%%\n' \
    "${cpu:-N/A}" "${mem:-N/A}" "${disk:-N/A}"
}

rotate_log() {
  local size
  size=$(wc -c < "$LOG_FILE" 2>/dev/null) || return 0
  (( size < LOG_MAX_BYTES )) || : > "$LOG_FILE"
}

write_log() {
  local timestamp
  timestamp=$(date '+%Y-%m-%d %H:%M:%S')
  echo "$timestamp CPU: ${cpu:-N/A}% Memory: ${mem:-N/A}% Disk: ${disk:-N/A}%" >> "$LOG_FILE" 2>/dev/null || {
    printf 'Warning: cannot write to %s; logging disabled\n' "$LOG_FILE" >&2
    LOG_ENABLED=0
  }
}

prev_sample=""
cpu=""
mem=""
disk=""

while :; do
  cpu=""
  mem=""
  disk=""

  sample=$(read_cpu_sample)
  if [[ -n $sample ]]; then
    if [[ -n $prev_sample ]]; then
      cpu=$(cpu_pct "$prev_sample" "$sample") || cpu=""
    else
      sleep "$CPU_SAMPLE_GAP"
      second=$(read_cpu_sample)
      if [[ -n $second ]]; then
        cpu=$(cpu_pct "$sample" "$second") || cpu=""
        sample=$second
      fi
    fi
  fi
  prev_sample=$sample

  mem=$(memory_usage) || mem=""
  disk=$(disk_usage) || disk=""

  show_status

  [[ -n $cpu ]] && check_threshold "CPU" "$cpu" "$CPU_THRESHOLD"
  [[ -n $mem ]] && check_threshold "Memory" "$mem" "$MEMORY_THRESHOLD"
  [[ -n $disk ]] && check_threshold "Disk" "$disk" "$DISK_THRESHOLD"

  if (( LOG_ENABLED )); then
    rotate_log
    write_log
  fi

  if (( RUN_ONCE )); then
    exit 0
  fi

  sleep "$INTERVAL"
done
