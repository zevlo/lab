import sys
from pathlib import Path

if len(sys.argv) < 2:
    print("usage: count_tree_errors.py <directory>")
    sys.exit(1)

root = Path(sys.argv[1])
if not root.is_dir():
    print(f"error: not a directory: {root}")
    sys.exit(1)

total = 0
for path in root.rglob("*.log"):
    if not path.is_file():
        continue
    with open(path) as f:
        for line in f:
            if "ERROR" in line:
                total += 1

print(f"{total} errors found")
