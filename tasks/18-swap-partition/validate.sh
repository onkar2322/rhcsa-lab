#!/bin/bash

# Task 18: Validate 512MB swap partition mounted permanently

echo "Checking if swap is enabled and permanent..."

# Check if swap is active
if swapon --show | grep -q "/dev/"; then
    SWAP_DEVICE=$(swapon --show | awk 'NR==2 {print $1}')
    
    # Check if it exists in /etc/fstab
    if grep -q "$SWAP_DEVICE" /etc/fstab; then
        echo "✅ PASS: Swap partition $SWAP_DEVICE is active and permanently configured."
    else
        echo "⚠️  WARNING: Swap partition $SWAP_DEVICE is active but not in /etc/fstab."
        echo "❌ FAIL: Swap is not permanent."
    fi
else
    echo "❌ FAIL: No active swap partition found."
fi
