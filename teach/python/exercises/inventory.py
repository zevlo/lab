inventory = {"ssh": 22, "http": 80, "https": 443}
inventory["prometheus"] = 9090

for service, port in inventory.items():
    print(f"{service} listens on {port}")
print(inventory.get("grafana", "not deployed"))
