#!/usr/bin/env bash
set -euo pipefail

# Validate that a service name was provided
if [[ $# -lt 1 ]] || [[ -z "${1-}" ]]; then
    echo "Usage: $0 <systemd-service-name> [webhook-url]" >&2
    exit 1
fi

SERVICE="$1"
# Reads webhook from second argument, environment variable, or falls back to hardcoded URL
WEBHOOK_URL="${2:-${SLACK_WEBHOOK_URL:-https://hooks.slack.com/services/T00/B00/X00}}"

# Check if the service is active
if ! systemctl is-active --quiet "$SERVICE"; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - ${SERVICE} is down. Attempting restart..."

    if systemctl restart "$SERVICE"; then
        MESSAGE="CRITICAL ALERT: ${SERVICE} crashed on $(hostname) but was successfully restarted."
    else
        MESSAGE="FATAL ALERT: ${SERVICE} crashed on $(hostname) and FAILED to restart!"
    fi

    # Post alert to Slack
    curl -s -X POST -H 'Content-type: application/json' \
        --data "{\"text\":\"${MESSAGE}\"}" \
        "${WEBHOOK_URL}"
fi
