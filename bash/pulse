#!/bin/bash
# Pulse - Endpoint Health and SSL Expiry Monitor

# Configuration
URLS=("https://example.com" "https://api.yourdomain.com")
ALERT_WEBHOOK="https://your.webhook.url/here" # e.g., Slack or Discord
DAYS_WARNING=14

send_alert() {
    local message=$1
    echo "ALERT: $message"
    # Uncomment the line below to enable Slack/Discord webhook alerts
    # curl -s -X POST -H 'Content-type: application/json' --data "{\"text\":\"🚨 $message\"}" "$ALERT_WEBHOOK"
}

for url in "${URLS[@]}"; do
    # 1. Check HTTP Status
    HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$url")
    if [ "$HTTP_STATUS" -ne 200 ] && [ "$HTTP_STATUS" -ne 301 ]; then
        send_alert "$url is returning status code $HTTP_STATUS!"
    fi

    # 2. Check SSL Expiry (requires openssl)
    DOMAIN=$(echo "$url" | awk -F/ '{print $3}')
    EXPIRY_DATE=$(echo | openssl s_client -servername "$DOMAIN" -connect "$DOMAIN:443" 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)
    
    if [ -n "$EXPIRY_DATE" ]; then
        EXPIRY_EPOCH=$(date -d "$EXPIRY_DATE" +%s)
        CURRENT_EPOCH=$(date +%s)
        DAYS_LEFT=$(( (EXPIRY_EPOCH - CURRENT_EPOCH) / 86400 ))

        if [ "$DAYS_LEFT" -le "$DAYS_WARNING" ]; then
            send_alert "SSL Certificate for $DOMAIN expires in $DAYS_LEFT days!"
        fi
    fi
done

echo "Pulse check complete."
