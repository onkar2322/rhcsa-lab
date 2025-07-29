#!/bin/bash

pass=true

# Function to check user exists
check_user() {
  id "$1" &>/dev/null
}

# Check group
if getent group sysadms >/dev/null; then
  echo "✅ Group 'sysadms' exists."
else
  echo "❌ Group 'sysadms' does not exist."
  pass=false
fi

# Check natasha
if check_user natasha && id -nG natasha | grep -qw sysadms; then
  echo "✅ User 'natasha' exists and is in group 'sysadms'."
else
  echo "❌ User 'natasha' is missing or not in group 'sysadms'."
  pass=false
fi

# Check harry
if check_user harry && id -nG harry | grep -qw sysadms; then
  echo "✅ User 'harry' exists and is in group 'sysadms'."
else
  echo "❌ User 'harry' is missing or not in group 'sysadms'."
  pass=false
fi

# Check sarah
if check_user sarah && [[ $(getent passwd sarah | cut -d: -f7) == "/sbin/nologin" ]] && ! id -nG sarah | grep -qw sysadms; then
  echo "✅ User 'sarah' has non-interactive shell and is not in 'sysadms'."
else
  echo "❌ User 'sarah' has wrong shell or is in group 'sysadms'."
  pass=false
fi

# Final result
if $pass; then
  echo -e "\n🎉 All checks passed. Task 22 complete!"
  exit 0
else
  echo -e "\n❗ Some checks failed. Please review your configuration."
  exit 1
fi
