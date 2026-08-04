#!/bin/bash
set -euo pipefail

if [ -f "$1" ]; then
  echo "file exists: $1"
else
  echo "file missing: $1"
fi
