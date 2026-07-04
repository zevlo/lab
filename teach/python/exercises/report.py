def service_report(name, state, env="dev"):
    if state == "down":
        return f"ALERT: {name} is down in {env}"
    return f"ok: {name}"

services = {
    "nginx": "up",
    "postgres": "down",
    "redis": "up"
}

for name, state in services.items():
    result = service_report(name, state, env="prod")
    print(result)
