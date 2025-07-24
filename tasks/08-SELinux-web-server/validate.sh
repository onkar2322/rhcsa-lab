#!/bin/bash

echo "🔍 Validating Task 08 - Web Server with SELinux on Port 82"

# Check if httpd is installed
if ! rpm -q httpd &>/dev/null; then
  echo "❌ Apache (httpd) is not installed."
  exit 1
fi

# Check if port 82 is configured in SELinux
if ! semanage port -l | grep http_port_t | grep -qw 82; then
  echo "❌ SELinux is not configured to allow HTTP on port 82."
  exit 1
fi

# Check if Apache config includes port 82
if ! grep -qE '^Listen 82' /etc/httpd/conf/httpd.conf; then
  echo "❌ Apache is not configured to listen on port 82."
  exit 1
fi

# Check if firewall includes port 82
if ! firewall-cmd --list-all --quiet | grep -q '82/tcp'; then
  echo "❌ Port 82 is not open in the firewall."
  exit 1
fi

# Check if httpd service is enabled
if ! systemctl is-enabled httpd &>/dev/null; then
  echo "❌ Apache (httpd) is not enabled to start at boot."
  exit 1
fi

# Check if httpd service is running
if ! systemctl is-active httpd &>/dev/null; then
  echo "❌ Apache (httpd) is not currently running."
  exit 1
fi

# Final Test: Try accessing page on port 82
if curl -s http://localhost:82 | grep -qi "<html>"; then
  echo "✅ Success: Web server is working on port 82!"
  exit 0
else
  echo "❌ Apache is running, but not serving content on port 82."
  exit 1
fi

