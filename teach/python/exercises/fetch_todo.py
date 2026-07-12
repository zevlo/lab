import sys
import json
from urllib.request import urlopen
from urllib.error import URLError

if len(sys.argv) < 2:
    print("usage: fetch_todo.py <url>")
    sys.exit(1)

url = sys.argv[1]

try:
    with urlopen(url) as response:
        body = response.read().decode()
        data = json.loads(body)
except URLError:
    print(f"error: could not fetch {url}")
    sys.exit(1)

print(f"title: {data['title']}")
print(f"completed: {data['completed']}")
