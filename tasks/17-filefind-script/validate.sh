#!/bin/bash

echo "🔍 Checking if script exists and is executable..."
if [[ -x /usr/local/bin/findfiles.sh ]]; then
    echo "✅ Script exists and is executable."
else
    echo "❌ Script missing or not executable."
    exit 1
fi

echo "📤 Running the script..."
/usr/local/bin/findfiles.sh

echo "📄 Checking output file..."
if [[ -f /var/findoutput ]]; then
    echo "✅ Output file /var/findoutput exists."
    if [[ -s /var/findoutput ]]; then
        echo "✅ Output file contains content."
        echo "✅ Task PASSED."
        exit 0
    else
        echo "⚠️ Output file is empty."
        exit 1
    fi
else
    echo "❌ Output file not found."
    exit 1
fi

