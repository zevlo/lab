services = {
    "nginx": "up", 
    "postgres": "down", 
    "redis": "up", 
    "sshd": "down"
}

for host, state in services.items():
    if host == "sshd" and state == "down":
        print(f"skipping {host} (maintenance)")
    elif state == "down":
        print(f"ALERT: {host} is down")
    else:
        print(f"ok: {host}")
