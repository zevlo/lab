#!/usr/bin/env bash

label="web server 1"
echo "=== health check: $label  ==="

now="$(date '+%F %T')"
host="$(hostname)"

echo "Host: $host | Time: $now"

if pgrep -x sshd >/dev/null; then
  echo "sshd: running"
else
  echo "sshd: not found"
fi

echo "=== done ==="
