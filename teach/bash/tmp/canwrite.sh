#!/usr/bin/env bash

# Guard 1: Ensure an argument was provided
if [ $# -eq 0 ]; then
  echo "usage: $0 /path/to/directory" >&2
  exit 1
fi

target="$1"

# Guard 2: Ensure the target exists and is a directory
if [[ ! -d "$target" ]]; then
  echo "error: '$target' is not a directory or does not exist" >&2
  exit 1
fi

# Guard 3: Ensure the directory is writable
if [[ ! -w "$target" ]]; then
  echo "error: directory '$target' is not writable" >&2
  exit 1
fi

echo "success: '$target' exists and is writable"
