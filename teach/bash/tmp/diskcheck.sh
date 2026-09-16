#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo "usage: $0 /path/to/check" >&2
  exit 1
fi
target="$1"
if [[ ! -e "$target" ]]; then
  echo "error: no such path: $target" >&2
  exit 1
fi
echo "=== disk check: $target ==="
df -h "$target"
