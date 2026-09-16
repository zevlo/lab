#!/usr/bin/env bash
if [ $# -eq 0 ]; then
  echo "usage: $0 <file>" >&2
  exit 1
fi
if [[ ! -f "$1" ]]; then
  echo "not a regular file: $1" >&2
  exit 1
fi
tail -n 15 "$1"
