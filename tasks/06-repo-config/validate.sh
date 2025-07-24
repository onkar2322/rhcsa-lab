#!/bin/bash

echo "🔍 Validating YUM client configuration..."

REPO_FILE="/etc/yum.repos.d/server.repo"

# Check if repo file exists
if [ ! -f "$REPO_FILE" ]; then
  echo "❌ $REPO_FILE not found."
  exit 1
fi

# Check BaseOS entry
grep -q "\[BaseOS\]" "$REPO_FILE"
if [ $? -ne 0 ]; then
  echo "❌ [BaseOS] section not found."
  exit 1
fi

grep -q "baseurl=http://content.example.com/rhel8.2/x86_64/dvd/BaseOS" "$REPO_FILE"
if [ $? -ne 0 ]; then
  echo "❌ BaseOS baseurl is incorrect or missing."
  exit 1
fi

# Check AppStream entry
grep -q "\[AppStream\]" "$REPO_FILE"
if [ $? -ne 0 ]; then
  echo "❌ [AppStream] section not found."
  exit 1
fi

grep -q "baseurl=http://content.example.com/rhel7.0/x86_64/dvd/AppStream" "$REPO_FILE"
if [ $? -ne 0 ]; then
  echo "❌ AppStream baseurl is incorrect or missing."
  exit 1
fi

# Optional: check if yum sees the repos
yum repolist enabled | grep -q "BaseOS"
yum repolist enabled | grep -q "AppStream"

if [ $? -eq 0 ]; then
  echo "✅ YUM client repositories appear to be configured correctly!"
  exit 0
else
  echo "⚠️ Repositories not listed in yum repolist. Double-check your configuration."
  exit 1
fi

