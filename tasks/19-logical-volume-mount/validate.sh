#!/bin/bash

LV_PATH="/dev/wgroup/wshare"
MOUNT_POINT="/mnt/wshare"
EXPECTED_SIZE_MB=400

echo "🔍 Checking logical volume existence..."
if lvdisplay "$LV_PATH" &>/dev/null; then
    echo "✅ Logical Volume exists: $LV_PATH"
else
    echo "❌ Logical Volume does not exist: $LV_PATH"
    exit 1
fi

echo "🔍 Checking logical volume size..."
ACTUAL_SIZE_MB=$(lvdisplay "$LV_PATH" | awk '/LV Size/ {print int($3)}')
if [ "$ACTUAL_SIZE_MB" -eq "$EXPECTED_SIZE_MB" ]; then
    echo "✅ LV size is ${ACTUAL_SIZE_MB}MB (Expected: ${EXPECTED_SIZE_MB}MB)"
else
    echo "❌ LV size is ${ACTUAL_SIZE_MB}MB (Expected: ${EXPECTED_SIZE_MB}MB)"
    exit 1
fi

echo "🔍 Checking filesystem type..."
FS_TYPE=$(blkid -o value -s TYPE "$LV_PATH")
if [[ "$FS_TYPE" == "vfat" ]]; then
    echo "✅ Filesystem is vfat"
else
    echo "❌ Filesystem is not vfat (Found: $FS_TYPE)"
    exit 1
fi

echo "🔍 Checking mount point..."
if mount | grep -q "$MOUNT_POINT"; then
    echo "✅ Mounted on $MOUNT_POINT"
else
    echo "❌ Not mounted on $MOUNT_POINT"
    exit 1
fi

echo "🔍 Checking /etc/fstab for permanent mount..."
if grep -q "$MOUNT_POINT" /etc/fstab; then
    echo "✅ Permanent mount entry found in /etc/fstab"
else
    echo "❌ No entry found in /etc/fstab for $MOUNT_POINT"
    exit 1
fi

echo "🎉 All checks passed!"
exit 0
