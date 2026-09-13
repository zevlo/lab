#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo "usage: $0 /path/to/check" >$2
  exit 1
fi

target="$1"
echo "=== disk check: $target ==="
df -h "$target"
