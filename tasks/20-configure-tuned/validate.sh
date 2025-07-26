#!/bin/bash

echo "🔍 Checking if tuned is installed..."
if ! rpm -q tuned &>/dev/null; then
    echo "❌ tuned is not installed."
    exit 1
fi

echo "✅ tuned is installed."

echo "🔍 Checking if tuned service is active..."
if systemctl is-active --quiet tuned; then
    echo "✅ tuned service is running."
else
    echo "❌ tuned service is not running."
    exit 1
fi

echo "🔍 Getting recommended tuned profile..."
RECOMMENDED_PROFILE=$(tuned-adm recommend)
ACTIVE_PROFILE=$(tuned-adm active | grep "Current active profile" | awk -F: '{print $2}' | xargs)

if [ "$RECOMMENDED_PROFILE" == "$ACTIVE_PROFILE" ]; then
    echo "✅ Recommended profile '$RECOMMENDED_PROFILE' is active."
else
    echo "❌ Active profile is '$ACTIVE_PROFILE', but recommended is '$RECOMMENDED_PROFILE'."
    exit 1
fi

echo "🎉 All checks passed!"

