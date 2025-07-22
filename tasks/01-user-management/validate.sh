#!/bin/bash

if id user1 &>/dev/null; then
  echo "✅ User exists."
  exit 0
else
  echo "❌ User 'user1' not found."
  exit 1
fi

