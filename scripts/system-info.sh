
#!/usr/bin/env bash
set -Eeuo pipefail

echo "========================================"
echo "          JENKINS TASK 2"
echo "         SYSTEM INFORMATION"
echo "========================================"

echo
echo "Build timestamp:"
date --iso-8601=seconds

echo
echo "Hostname:"
hostname

echo
echo "Operating system:"
if [[ -r /etc/os-release ]]; then
    . /etc/os-release
    echo "${PRETTY_NAME:-Unknown Linux distribution}"
else
    echo "Unknown operating system"
fi

echo
echo "Current user:"
id -un

echo
echo "Disk usage:"
df -h /

echo
echo "Memory usage:"
free -h

echo
echo "========================================"
echo "SCRIPT EXECUTION SUCCESSFUL"
echo "========================================"
