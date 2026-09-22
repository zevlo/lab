#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo "usage: $0 /path/to/check [more paths ...]" >&2
  exit 1
fi
for target in "$@"; do
  if [[ ! -e "$target" ]]; then
    echo "error: no such path: $target" >&2
    continue
  fi
  echo "=== disk check: $target ==="
  df -h "$target"
done
