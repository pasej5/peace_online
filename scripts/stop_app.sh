#!/usr/bin/bash

# Log start of script
echo "Starting stop_app.sh script" >> /tmp/deploy.log

# Find and kill the Gunicorn process
echo "Stopping Gunicorn process..." >> /tmp/deploy.log
pkill -f gunicorn

# Check if pkill was successful
if [ $? -eq 0 ]; then
    echo "Gunicorn process stopped successfully." >> /tmp/deploy.log
else
    echo "Failed to stop Gunicorn process." >> /tmp/deploy.log
fi

# Log end of script
echo "stop_app.sh script finished" >> /tmp/deploy.log