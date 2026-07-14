import sys

if len(sys.argv) < 2:
    print("usage: write_report.py <outfile>")
    sys.exit(1)

path = sys.argv[1]

with open(path, "w") as f:
    f.write("status: ok\n")
    f.write("checked: 3\n")

print(f"wrote {path}")
