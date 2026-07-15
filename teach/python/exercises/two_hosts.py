class Host:
    def __init__(self, name, status):
        self.name = name
        self.status = status

web = Host("web-01", "up")
db = Host("db-01", "down")

print(f"{web.name} is {web.status}")
print(f"{db.name} is {db.status}")

web.status = "restarting"
print(web.status)
print(db.status)
