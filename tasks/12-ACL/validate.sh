#!/bin/bash

FILE="/var/tmp/fstab"
PASS=true

echo "Validating Task 12 - ACL Configuration on $FILE"

# 1. Check if file exists
if [ ! -f "$FILE" ]; then
  echo "❌ File $FILE does not exist."
  PASS=false
fi

# 2. Check owner and group
OWNER=$(stat -c %U "$FILE" 2>/dev/null)
GROUP=$(stat -c %G "$FILE" 2>/dev/null)
if [[ "$OWNER" != "root" || "$GROUP" != "root" ]]; then
  echo "❌ Ownership should be root:root. Found $OWNER:$GROUP"
  PASS=false
fi

# 3. Check execute permissions (should be none)
PERMS=$(stat -c %A "$FILE")
if [[ $PERMS == *x* ]]; then
  echo "❌ File has execute permissions: $PERMS"
  PASS=false
fi

# 4. Check ACL for sarah (should have rw-)
SARAH_PERM=$(getfacl -p "$FILE" | awk '/^user:sarah:/ {print $2}')
if [[ "$SARAH_PERM" != "rw-" ]]; then
  echo "❌ sarah should have rw- access. Found: $SARAH_PERM"
  PASS=false
fi

# 5. Check ACL for harry (should have ---)
HARRY_PERM=$(getfacl -p "$FILE" | awk '/^user:harry:/ {print $2}')
if [[ "$HARRY_PERM" != "---" ]]; then
  echo "❌ harry should have --- access. Found: $HARRY_PERM"
  PASS=false
fi

# 6. Check others have read-only (r--)
OTHER_PERM=$(getfacl -p "$FILE" | awk '/^other::/ {print $2}')
if [[ "$OTHER_PERM" != "r--" ]]; then
  echo "❌ Others should have read-only access. Found: $OTHER_PERM"
  PASS=false
fi

# Final result
if [ "$PASS" = true ]; then
  echo "✅ Task 12 Passed: ACLs and permissions are correctly set."
else
  echo "❌ Task 12 Failed: One or more conditions did not match."
fi

