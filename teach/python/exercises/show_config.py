import os

env_name = os.environ.get("APP_ENV", "dev")
api_url = os.environ.get("API_URL")

if api_url is None:
    print("error: API_URL is not set")
    raise SystemExit(1)

print(f"env: {env_name}")
print(f"url: {api_url}")
