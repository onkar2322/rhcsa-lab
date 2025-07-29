#!/bin/bash

echo "Validating Task 21..."

# Check systemd service
if systemctl is-enabled container-logserver &>/dev/null; then
  echo "✔ container-logserver is enabled"
else
  echo "✘ container-logserver is not enabled"
fi

# Check if container is running
if podman ps --format "{{.Names}}" | grep -q logserver; then
  echo "✔ logserver container is running"
else
  echo "✘ logserver container is not running"
fi

# Check mount
if mount | grep -q "/home/Walhalla/container_logserver"; then
  echo "✔ Volume mount exists"
else
  echo "✘ Volume mount not found"
fi

# Check journal files
journal_count=$(find /home/Walhalla/container_logserver -name "*.journal" | wc -l)
if [ "$journal_count" -gt 0 ]; then
  echo "✔ Found $journal_count .journal files in container_logserver"
else
  echo "✘ No .journal files found in /home/Walhalla/container_logserver"
fi

