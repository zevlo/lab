import sys

class Host:
    def __init__(self, name, status):
        self.name = name
        self.status = status

    def summary(self):
        return f"{self.name}: {self.status}"

def main():
    if len(sys.argv) < 3:
        print("usage: host_check.py <name> <status>")
        raise SystemExit(1)
    host = Host(sys.argv[1], sys.argv[2])
    print(host.summary())

if __name__ == "__main__":
    main()
