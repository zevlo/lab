hosts = [
    "web-01", "web-02", "web-01", "db-01",
    "web-02", "cache-01", "web-01", "db-01",
]

unique = set(hosts)

print(f"{len(hosts)} total entries")
print(f"{len(unique)} unique hosts:")

for host in sorted(unique):
    print(host)
