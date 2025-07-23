#!/bin/bash

echo -e "\n🔍 Validating Task – Group and User Membership\n"

PASS=true

# 1. Check group exists
if getent group devteam > /dev/null; then
    echo "✅ Group 'devteam' exists."
else
    echo "❌ Group 'devteam' not found."
    echo "⚠️  Hint: Use 'groupadd devteam'"
    PASS=false
fi

# 2. Check user exists
if id devadmin &> /dev/null; then
    echo "✅ User 'devadmin' exists."
else
    echo "❌ User 'devadmin' not found."
    echo "⚠️  Hint: Use 'useradd devadmin'"
    PASS=false
fi

# 3. Check if devadmin is in devteam group
if id devadmin &> /dev/null && id devadmin | grep -q "devteam"; then
    echo "✅ User 'devadmin' is a member of 'devteam'."
else
    echo "❌ 'devadmin' is not a member of 'devteam'."
    echo "⚠️  Hint: Use 'usermod -aG devteam devadmin'"
    PASS=false
fi

# Final result
if [ "$PASS" = true ]; then
    echo -e "\n🎉 All checks passed successfully!"
else
    echo -e "\n❌ Some checks failed. 🔁 Please try again."
fi
