class Host:
    def __init__(self, name, status):
        self.name = name
        self.status = status
    
    def summary(self):
        return f"{self.name}: {self.status}"

web = Host("web-01", "up")
db = Host("db-01", "down")

print(web.summary())
print(db.summary())
print(Host.summary(web))
