#!/usr/bin/bash

# Update settings.py
sed -i 's/\[]/\["13.48.217.164"]/' /home/ubuntu/peace_online/peace_online/settings.py

# Ensure the database file exists and is writable
DATABASE_PATH="/var/lib/peace_online/db.sqlite3"
if [ ! -f "$DATABASE_PATH" ]; then
  echo "Database file not found. Creating a new one."
  touch "$DATABASE_PATH"
fi

chmod 664 "$DATABASE_PATH"  # Ensure the file is writable

# Apply migrations and collect static files
python3 manage.py migrate
python3 manage.py makemigrations
python3 manage.py collectstatic --noinput

# Restart services
sudo systemctl restart gunicorn
sudo systemctl restart nginx

# Check the status of services
sudo systemctl status gunicorn
sudo systemctl status nginx

# Uncomment to debug errors
# sudo tail -f /var/log/nginx/error.log
# sudo systemctl reload nginx
# sudo nginx -t