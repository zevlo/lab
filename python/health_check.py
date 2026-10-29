import shutil

usage = shutil.disk_usage("/")

total_gb = usage.total / (1024 ** 3)
used_gb = usage.used / (1024 ** 3)
percent_used = (used_gb / total_gb) * 100  # or keep as ratio for f-string

print(f"Total: {total_gb:.2f} GB")
print(f"Used:  {used_gb:.2f} GB")

if percent_used > 80:
    print("Warning: Low disk space")
else:
    print("Disk space is healthy")
