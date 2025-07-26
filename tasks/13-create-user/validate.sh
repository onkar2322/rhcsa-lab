#!/bin/bash

# Task 13 Validation Script – Check user 'bob' with UID 2112 and test password

USER_NAME="bob"
EXPECTED_UID="2112"
TEST_PASSWORD="trootent"

# Check if user exists
if id "$USER_NAME" &>/dev/null; then
    actual_uid=$(id -u "$USER_NAME")
    if [[ "$actual_uid" == "$EXPECTED_UID" ]]; then
        echo "✅ PASS: User '$USER_NAME' exists with UID $EXPECTED_UID."
    else
        echo "❌ FAIL: User '$USER_NAME' exists but UID is $actual_uid (expected: $EXPECTED_UID)."
        exit 1
    fi
else
    echo "❌ FAIL: User '$USER_NAME' does not exist."
    exit 1
fi

# Check if password is correctly set using su command with expect
if command -v expect &>/dev/null; then
    expect -c "
    spawn su - $USER_NAME -c \"whoami\"
    expect \"Password:\"
    send \"$TEST_PASSWORD\r\"
    expect {
        \"$USER_NAME\" {
            send_user \"✅ PASS: Password authentication for user '$USER_NAME' successful.\n\"
            exit 0
        }
        \"su: Authentication failure\" {
            send_user \"❌ FAIL: Password authentication for user '$USER_NAME' failed.\n\"
            exit 1
        }
    }
    "
else
    echo "⚠️ WARNING: 'expect' is not installed. Password validation skipped."
    echo "✅ PASS: User and UID validation completed."
fi

