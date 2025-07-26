#!/bin/bash

SOURCE_FILE="/usr/share/dict/words"
TARGET_FILE="/root/lines"
SEARCH_STRING="ich"

echo "🔍 Checking if $TARGET_FILE exists..."
if [ ! -f "$TARGET_FILE" ]; then
  echo "❌ FAIL: $TARGET_FILE does not exist."
  exit 1
fi

echo "✅ File exists: $TARGET_FILE"

expected_lines=$(grep "$SEARCH_STRING" "$SOURCE_FILE" | sort)
actual_lines=$(sort "$TARGET_FILE")

if [ "$expected_lines" = "$actual_lines" ]; then
  echo "🎉 PASS: $TARGET_FILE contains all lines with '$SEARCH_STRING' from $SOURCE_FILE"
else
  echo "❌ FAIL: Contents of $TARGET_FILE do not match expected results."
  exit 1
fi
