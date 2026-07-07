import json

with open("config.json") as f:
    cfg = json.load(f)

print(f"env: {cfg['env']}")
print(f"db host: {cfg['db']['host']}")

for service in cfg["services"]:
    print(f"{service['name']}: {service['port']}")

api_text = '{"status": "ok", "healthy": 2}'
api_data = json.loads(api_text)
print(f"status: {api_data['status']}")
