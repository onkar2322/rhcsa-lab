#!/bin/bash

echo "🔍 Validating Task 09: Collaborative Directory..."

PASS=true

# 1. Directory exists
if [ -d /home/manager ]; then
  echo "✅ Directory /home/manager exists"
else
  echo "❌ /home/manager does not exist"
  PASS=false
fi

# 2. Group ownership is sysadms
GROUP=$(stat -c %G /home/manager)
if [ "$GROUP" == "sysadms" ]; then
  echo "✅ Group ownership is sysadms"
else
  echo "❌ Group ownership is not sysadms, it's $GROUP"
  PASS=false
fi

# 3. Permissions allow full group access and no 'others' access
PERM=$(stat -c %A /home/manager)
if [[ "$PERM" == d*rwxrwx---* ]]; then
  echo "✅ Permissions are correct for group and others"
else
  echo "❌ Permissions are not correct. Found: $PERM"
  PASS=false
fi

# 4. Check for setgid bit
MODE=$(stat -c %a /home/manager)
if (( $((MODE/1000)) % 10 == 2 )); then
  echo "✅ Setgid bit is set"
else
  echo "❌ Setgid bit is not set"
  PASS=false
fi

# Final Result
if $PASS; then
  echo -e "\n🎉 Task PASSED!"
  exit 0
else
  echo -e "\n⚠️ Task FAILED. Please review the above checks."
  exit 1
fi

