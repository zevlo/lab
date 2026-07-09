import sys

if len(sys.argv) < 2:
    print("usage: count_errors.py <logfile>")
    sys.exit(1)

path = sys.argv[1]
count = 0

try:
    with open(path) as f:
        for line in f:
            if "ERROR" in line:
                count += 1
except FileNotFoundError:
    print(f"error: file not found: {path}")
    sys.exit(1)

print(f"{count} errors found")
