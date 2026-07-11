import json
import sys
import urllib.request
from urllib.error import HTTPError, URLError

if len(sys.argv) < 2:
    print("usage: fetch_json.py <url>")
    sys.exit(1)

url = sys.argv[1]

try:
    with urllib.request.urlopen(url) as response:
        body = response.read()
        data = json.loads(body)
except HTTPError as e:
    print(f"error: HTTP {e.code}")
    sys.exit(1)
except URLError:
    print("error: could not reach URL")
    sys.exit(1)
except json.JSONDecodeError:
    print("error: response is not valid JSON")
    sys.exit(1)

print(data["title"])
