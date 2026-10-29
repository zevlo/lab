import os
import shutil
import sys

def check_disk(path, threshold):
    usage = shutil.disk_usage(path)
    percent_used = (usage.used / usage.total) * 100
    if percent_used > threshold:
        return False
    else:
        return True

def check_cpu(threshold_percent=80):
    load1, _, _ = os.getloadavg()
    cores = os.cpu_count()
    usage_percent = (load1 / cores) * 100
    if usage_percent > threshold_percent:
        return False
    else:
        return True

# --- Run checks ---
disk_ok = check_disk("/", 80)
cpu_ok = check_cpu(80)

if disk_ok and cpu_ok:
    print("SUCCESS: System is healthy")
    sys.exit(0)
else:
    print("WARNING: Health check failed")
    sys.exit(1)
