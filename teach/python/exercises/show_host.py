import sys

def status_line(name):
    return f"host: {name}"

def main():
    if len(sys.argv) < 2:
        print("usage: show_host.py <name>")
        raise SystemExit(1)
    name = sys.argv[1]
    print(status_line(name))

if __name__ == "__main__":
    main()
