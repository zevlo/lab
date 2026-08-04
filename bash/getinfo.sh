#!/bin/bash
# This script retrieves CPU, memory, disk, and other information of a Linux server.

# Retrieve CPU information (Logical Cores)
cpu_num=$(grep -c '^processor' /proc/cpuinfo)

# Retrieve total memory size (in GB)
memory_total=$(free -g | awk '/^Mem:/ {print $2}')

# Retrieve available memory size (in MB)
memory_available=$(free -m | awk '/^Mem:/ {print $7}')

# Retrieve total disk size of the root filesystem
disk_size=$(df -h / | awk 'NR==2 {print $2}')

# Retrieve system bit architecture
system_bit=$(getconf LONG_BIT)

# Retrieve the number of currently running processes
process=$(($(ps -ef | wc -l) - 1))

# Retrieve the number of installed software packages
if command -v dpkg-query > /dev/null 2>&1; then
    software_num=$(dpkg-query -f '${binary:Package}\n' -W | wc -l)
elif command -v rpm > /dev/null 2>&1; then
    software_num=$(rpm -qa | wc -l)
else
    software_num="Unknown (Unsupported Package Manager)"
fi

# Retrieve the primary IP address
primary_interface=$(ip route | grep default | awk '{print $5}' | head -n 1)
if [ -n "$primary_interface" ]; then
    ip=$(ip addr show "$primary_interface" | awk '/inet / {print $2}' | sed 's|/.*||')
else
    ip="No active interface found"
fi

# Output information
echo "cpu num: $cpu_num"
echo "memory total: $memory_total G"
echo "memory available: $memory_available M"
echo "disk size (root): $disk_size"
echo "system bit: $system_bit"
echo "process: $process"
echo "software num: $software_num"
echo "ip: $ip"
