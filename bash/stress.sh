#!/usr/bin/env bash
set -euo pipefail

# Start CPU stress in background
stress --cpu 8 &
STRESS_PID=$!
trap 'kill "$STRESS_PID" 2>/dev/null || true' EXIT

# Setup log file
LOGFILE="test_runs_$(date +%s).log"
echo "Logging to $LOGFILE"

# Run tests until one fails
RUN=1
while cargo test my_test > "$LOGFILE" 2>&1; do
    echo "Run $RUN passed"
    RUN=$((RUN + 1))
done

# Cleanup and report
echo "Test failed on run $RUN"
echo "Last 20 lines of output:"
tail -n 20 "$LOGFILE"
echo "Full log: $LOGFILE"
