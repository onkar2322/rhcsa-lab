#!/bin/bash

ARCHIVE="/root/backup.tar.bz2"

echo "Checking if archive exists..."
if [ ! -f "$ARCHIVE" ]; then
  echo "❌ FAIL: $ARCHIVE does not exist."
  exit 1
else
  echo "✅ PASS: Archive file exists."
fi

echo "Checking if archive is a valid bzip2 tarball..."
if file "$ARCHIVE" | grep -q "bzip2 compressed data"; then
  echo "✅ PASS: Archive is bzip2 compressed."
else
  echo "❌ FAIL: Archive is not bzip2 compressed."
  exit 1
fi

echo "Checking archive contents for /usr/local..."
if tar -tjf "$ARCHIVE" | grep -q "^usr/local"; then
  echo "✅ PASS: /usr/local is included in the archive."
  exit 0
else
  echo "❌ FAIL: /usr/local is not found in the archive."
  exit 1
fi

