lines = [
    "INFO web-01 started",
    "ERROR db-01 connection failed",
    "INFO web-02 ready",
    "ERROR cache-01 timeout",
    "WARN web-01 high load",
    "ERROR web-01 disk full",
]

hosts = [line.split()[1] for line in lines
         if line.startswith("ERROR")]

print(f"{len(hosts)} hosts with errors:")
for host in hosts:
    print(host)
