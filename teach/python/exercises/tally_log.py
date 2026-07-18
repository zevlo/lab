counts = {}

try:
    with open("app.log") as f:
        for line in f:
            level = line.split()[0]
            counts[level] = counts.get(level, 0) + 1
except FileNotFoundError:
    print("error: app.log not found")
    raise SystemExit(1)

for level, n in counts.items():
    print(f"{level}: {n}")
