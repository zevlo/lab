import subprocess

result = subprocess.run(
        ["echo", "ok"],
        capture_output=True,
        text=True,
)

print(result.stdout.strip())
print(result.returncode)

result = subprocess.run(
        ["false"],
        capture_output=True,
        text=True,
)

if result.returncode != 0:
    print(f"FAILED with code {result.returncode}")
