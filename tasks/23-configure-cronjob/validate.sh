
#!/bin/bash

user="natasha"
cron_found=false
log_found=false

# Check if user exists
if id "$user" &>/dev/null; then
    echo "✅ User '$user' exists."
else
    echo "❌ User '$user' does not exist."
    exit 1
fi

# Check if the correct cron job exists
if crontab -l -u "$user" 2>/dev/null | grep -q 'logger "EX200 in progress"'; then
    echo "✅ Cron job is correctly configured for user '$user'."
    cron_found=true
else
    echo "❌ Cron job for user '$user' is missing or incorrect."
fi

# Check if log message exists (wait a minute after creation)
if sudo grep "EX200 in progress" /var/log/messages | grep "$user" &>/dev/null; then
    echo "✅ Log entry found for 'EX200 in progress'."
    log_found=true
else
    echo "⚠️ Log message not yet found. Wait 1-2 minutes after setting the cron."
fi

# Final Result
if $cron_found; then
    echo -e "\n🎉 Task validation complete: Cron setup looks correct."
    exit 0
else
    echo -e "\n❗ Task validation failed: Please check cron setup."
    exit 1
fi

