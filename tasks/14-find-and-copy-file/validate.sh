#!/bin/bash

TARGET_DIR="/root/harry-files"
USER="harry"

echo "🔍 Checking if target directory exists..."
if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ FAIL: Directory $TARGET_DIR does not exist."
  exit 1
fi

echo "✅ Directory exists: $TARGET_DIR"
echo "🔍 Locating original files owned by user '$USER'..."

# Get list of files owned by harry
mapfile -t original_files < <(find / -user "$USER" -type f 2>/dev/null)

if [ "${#original_files[@]}" -eq 0 ]; then
  echo "⚠️  WARNING: No files owned by '$USER' found on the system."
  exit 0
fi

pass=true

for file in "${original_files[@]}"; do
  fname=$(basename "$file")
  if [ ! -f "$TARGET_DIR/$fname" ]; then
    echo "❌ FAIL: $fname not found in $TARGET_DIR"
    pass=false
  else
    echo "✅ Found: $fname"
  fi
done

if [ "$pass" = true ]; then
  echo "🎉 PASS: All files owned by user '$USER' were copied correctly to $TARGET_DIR"
else
  echo "🚫 FAIL: Some files were not copied correctly. Please review."
  exit 1
fi
