#!/bin/bash

echo "🔍 Validating AutoFS Configuration for ldapuser2..."

PASS_COUNT=0
TOTAL_TESTS=5

# 1. Check if autofs is installed
if rpm -q autofs &>/dev/null; then
    echo "✔️  autofs is installed"
    ((PASS_COUNT++))
else
    echo "❌ autofs is not installed"
fi

# 2. Check if /etc/auto.master includes /home/guests
if grep -qE '^/home/guests\s+/etc/auto\.' /etc/auto.master; then
    echo "✔️  Entry exists in /etc/auto.master"
    ((PASS_COUNT++))
else
    echo "❌ Missing entry in /etc/auto.master"
fi

# 3. Check if autofs service is enabled and active
if systemctl is-enabled autofs &>/dev/null && systemctl is-active autofs &>/dev/null; then
    echo "✔️  autofs service is enabled and running"
    ((PASS_COUNT++))
else
    echo "❌ autofs service is not properly enabled or not running"
fi

# 4. Check if /home/guests/ldapuser2 is mounted on access
mkdir -p /tmp/test_mount_check
if ls /home/guests/ldapuser2 &>/dev/null; then
    echo "✔️  ldapuser2 home directory is accessible"
    ((PASS_COUNT++))
else
    echo "❌ ldapuser2 home directory is NOT accessible"
fi

# 5. Check if the directory is writable by ldapuser2
if sudo -u ldapuser2 bash -c "touch /home/guests/ldapuser2/testfile" &>/dev/null; then
    echo "✔️  ldapuser2 can write to home directory"
    sudo -u ldapuser2 rm -f /home/guests/ldapuser2/testfile
    ((PASS_COUNT++))
else
    echo "❌ ldapuser2 cannot write to home directory"
fi

# Summary
echo "✅ Passed $PASS_COUNT out of $TOTAL_TESTS tests."

if [[ $PASS_COUNT -eq $TOTAL_TESTS ]]; then
    echo "🎉 AutoFS Configuration for ldapuser2 is correct!"
    exit 0
else
    echo "⚠️  Please review the failed items and recheck the setup."
    exit 1
fi

