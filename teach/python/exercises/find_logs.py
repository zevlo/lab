import sys
from pathlib import Path

if len(sys.argv) < 2:
    print("usage: find_logs.py <directory>")
    sys.exit(1)

root = Path(sys.argv[1])
if not root.is_dir():
    print(f"error: not a directory: {root}")
    sys.exit(1)

for path in root.rglob("*.log"):
    if path.is_file():
        print(path)
