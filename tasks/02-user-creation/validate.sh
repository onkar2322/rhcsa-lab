#!/bin/bash

echo "🔍 Validating Task – User Creation"

fail=0

# Check if user exists
if id "devuser" &>/dev/null; then
    echo "✅ User 'devuser' exists."
else
    echo "❌ User 'devuser' does NOT exist."
    echo "⚠️ Hint: You might have missed a step while creating the user."
    fail=1
fi

# Check home directory
if [ -d "/home/devuser" ]; then
    echo "✅ Home directory for 'devuser' exists."
else
    echo "❌ Home directory '/home/devuser' not found."
    echo "⚠️ Hint: Something might be missing during user creation."
    fail=1
fi

# Check shell
user_shell=$(getent passwd devuser | cut -d: -f7)
if [ "$user_shell" == "/bin/bash" ]; then
    echo "✅ Shell for 'devuser' is set to /bin/bash."
else
    echo "❌ Incorrect shell for 'devuser'. Found: $user_shell"
    echo "⚠️ Hint: Check how you assigned the shell."
    fail=1
fi

# Result
if [ "$fail" -eq 0 ]; then
    echo -e "\n🎉 All checks passed. Task completed successfully."
else
    echo -e "\n❌ Some checks failed."
    echo "🔁 Please review your steps and try again."
fi

