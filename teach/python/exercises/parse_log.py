error_count = 0

with open("app.log") as f:
    for line in f:
        line = line.strip()
        if "ERROR" in line:
            parts = line.split()
            time = parts[1]
            message = " ".join(parts[3:])
            print(f"{time} - {message}")
            error_count = error_count + 1

print(f"{error_count} errors found")
