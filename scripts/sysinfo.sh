#!/usr/bin/env bash
set -euo pipefail

echo "User:      $(id -un) (effective UID $(id -u))"
echo "Hostname:  $(hostname)"
echo "Kernel:    $(uname -r)"
echo "Date:      $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "Disk usage:"
df -h /
echo "Memory usage:"
free -h
if command -v docker >/dev/null 2>&1 && docker info >/dev/null 2>&1; then
    echo "Docker:    daemon running"
else
    echo "Docker:    daemon not running or not installed"
fi
