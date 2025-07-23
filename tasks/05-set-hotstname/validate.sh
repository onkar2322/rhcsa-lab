#!/bin/bash

EXPECTED="alpha.domain1.example.com"
CURRENT=$(hostnamectl --static)

echo "================== Validation Result =================="

if [[ "$CURRENT" == "$EXPECTED" ]]; then
    echo "✅ PASS: Hostname is correctly set to '$CURRENT'."
    exit 0
else
    echo "❌ FAIL: Hostname is '$CURRENT'. Expected: '$EXPECTED'"
    echo "Hint: Use the 'hostnamectl' command to set the static hostname."
    exit 1
fi

