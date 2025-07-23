#!/bin/bash

# Define variables
LV_PATH=$(lvdisplay | grep "LV Path" | awk '{print $3}' | grep "/mylv")
EXPECTED_MIN=200000  # in KB
EXPECTED_MAX=300000  # in KB
pass=true

echo "🔍 Checking Logical Volume Size for /mylv..."

if [ -z "$LV_PATH" ]; then
    echo "❌ Logical volume 'mylv' not found."
    pass=false
else
    SIZE_KB=$(lvdisplay $LV_PATH | awk '/LV Size/ {print $3*1024}' | cut -d. -f1)
    
    echo "➡️ Found size: $SIZE_KB KB"

    if [[ "$SIZE_KB" -ge "$EXPECTED_MIN" && "$SIZE_KB" -le "$EXPECTED_MAX" ]]; then
        echo "✅ Logical volume size is within the required range (200MB - 300MB)."
    else
        echo "❌ Size is NOT in range. Found $SIZE_KB KB."
        pass=false
    fi
fi

$pass && echo "✅ Task PASSED!" || echo "❌ Task FAILED!"

