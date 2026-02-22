#!/bin/bash
# Sweep - Automated Docker and System Cleanup

LOG_FILE="/var/log/sweep_cleanup.log"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "[$DATE] Starting system sweep..." | tee -a "$LOG_FILE"

# Calculate disk space before
SPACE_BEFORE=$(df / | awk 'NR==2 {print $4}')

# Execute Docker cleanup (containers, networks, images, and volumes)
echo "Cleaning up Docker resources..." | tee -a "$LOG_FILE"
docker system prune -a --volumes -f >> "$LOG_FILE" 2>&1

# Clear out older system logs (journalctl) to free up more space
echo "Vacuuming old journalctl logs (keeping last 7 days)..." | tee -a "$LOG_FILE"
journalctl --vacuum-time=7d >> "$LOG_FILE" 2>&1

# Calculate disk space after
SPACE_AFTER=$(df / | awk 'NR==2 {print $4}')
SAVED_KB=$((SPACE_AFTER - SPACE_BEFORE))
SAVED_MB=$((SAVED_KB / 1024))

echo "[$DATE] Sweep complete. Reclaimed roughly ${SAVED_MB} MB of space." | tee -a "$LOG_FILE"
echo "---------------------------------------------------" | tee -a "$LOG_FILE"
