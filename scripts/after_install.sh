#!/usr/bin/bash

echo "Pull Finished"

# Activate the virtual environment
source /home/ubuntu/peace_online/venv/bin/activate

# Change to the project directory
cd /home/ubuntu/peace_online

# Run Django management commands
python manage.py migrate
python manage.py collectstatic --noinput

# Adjust permissions and ownership of the SQLite database
sudo chmod 664 db.sqlite3
sudo chown www-data:www-data db.sqlite3

# Reload and restart services
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl restart gunicorn

echo "Deployment Finished"