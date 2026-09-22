#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "usage: $0 <file> [more files ...]" >&2
  exit 1
fi

for file in "$@"; do
  if [[ ! -f "$file" ]]; then
    echo "not a regular file: $file" >&2
    continue
  fi

  tail -n 15 "$file"
done
