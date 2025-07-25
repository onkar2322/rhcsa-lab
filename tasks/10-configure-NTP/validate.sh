
#!/bin/bash

echo "===== Validating NTP Configuration ====="

# Check if chrony is installed
if ! rpm -q chrony &>/dev/null; then
    echo "[FAIL] chrony package is not installed."
    exit 1
fi

# Check if chronyd service is active and enabled
if ! systemctl is-active --quiet chronyd; then
    echo "[FAIL] chronyd service is not active."
    exit 1
fi

if ! systemctl is-enabled --quiet chronyd; then
    echo "[FAIL] chronyd service is not enabled."
    exit 1
fi

# Check if time.nplindia.org is in chrony.conf
if grep -q "^server time.nplindia.org" /etc/chrony.conf; then
    echo "[PASS] time.nplindia.org configured in chrony.conf"
else
    echo "[FAIL] time.nplindia.org not found in /etc/chrony.conf"
    exit 1
fi

echo "[SUCCESS] All validations passed."





