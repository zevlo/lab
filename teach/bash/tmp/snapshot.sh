#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "usage: $0 /path/to/snapshot" >&2
  exit 1
fi
target="$1"
if [[ ! -d "$target" ]]; then
  echo "error: not a directory: $target" >&2
  exit 1
fi
name="snapshot-$(date +%F).tar.gz"
if tar -czf "$name" "$target"; then
  echo "wrote $name"
else
  echo "error: tar failed" >&2
  exit 1
fi
