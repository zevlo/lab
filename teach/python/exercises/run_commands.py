import json
import subprocess

try:
    with open("commands.json") as f:
        cfg = json.load(f)
except FileNotFoundError:
    print("error: commands file not found")
except json.JSONDecodeError:
    print("error: commands file is not valid JSON")
else:
    for item in cfg["commands"]:
        result = subprocess.run(
            item["argv"],
            capture_output=True,
            text=True,
        )
        if result.returncode == 0:
            print(f"{item['name']}: {result.stdout.strip()}")
        else:
            print(f"{item['name']}: error code {result.returncode}")
