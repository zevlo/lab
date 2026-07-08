import json

try:
    with open("config.json") as f:
        cfg = json.load(f)
    print(f"env: {cfg['env']}")
except FileNotFoundError:
    print("error: config file not found")
except json.JSONDecodeError:
    print("error: config is not valid JSON")
except KeyError:
    print("error: required key missing from config")
