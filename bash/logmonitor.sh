#!/usr/bin/env bash
set -euo pipefail

readonly DEFAULT_LOG="/var/log/auth.log"
readonly PATTERN="authentication failure"
readonly RECENT_LIMIT=5

usage() {
    cat <<EOF
Usage: $(basename "$0") [logfile]

Scan a log file for authentication failures.
  logfile    path to log file (default: ${DEFAULT_LOG})

Exit codes: 0 = clean, 1 = failures found, 2 = error
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    usage
    exit 0
fi

if [[ $# -gt 1 ]]; then
    usage >&2
    exit 2
fi

readonly LOG_FILE="${1:-$DEFAULT_LOG}"

if [[ ! -e "$LOG_FILE" ]]; then
    echo "ERROR: Log file not found: $LOG_FILE" >&2
    echo "Note: ${DEFAULT_LOG} is Debian/Ubuntu-specific (RHEL uses /var/log/secure)." >&2
    exit 2
fi

if [[ ! -r "$LOG_FILE" ]]; then
    echo "ERROR: Log file not readable: $LOG_FILE" >&2
    echo "Hint: re-run with sudo: sudo $(basename "$0") \"$LOG_FILE\"" >&2
    exit 2
fi

STATUS=0
MATCHES=$(grep "$PATTERN" "$LOG_FILE") || STATUS=$?
if (( STATUS > 1 )); then
    echo "ERROR: Failed to scan $LOG_FILE" >&2
    exit 2
fi

echo "--- Authentication Log Monitor ---"

if (( STATUS == 0 )); then
    FAILURE_COUNT=$(wc -l <<<"$MATCHES" | tr -d ' ')
    echo "WARNING: Found $FAILURE_COUNT failed login attempts."
    echo "Last $RECENT_LIMIT:"
    tail -n "$RECENT_LIMIT" <<<"$MATCHES" | sed 's/^/  /'
    echo "----------------------------------"
    exit 1
fi

echo "OK: No failed login attempts found."
echo "----------------------------------"
exit 0
