servers = ["prod-web-01", "prod-web-02", "prod-db-01"]
servers.append("prod-cache-01")

for i in servers:
    print(f"checking {i}")
print(f"checked {len(servers)} servers")
