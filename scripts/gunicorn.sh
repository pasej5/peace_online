#!/usr/bin/bash

# Copy the Gunicorn service files
sudo cp /home/ubuntu/peace_online/gunicorn/gunicorn.socket /etc/systemd/system/gunicorn.socket
sudo cp /home/ubuntu/peace_online/gunicorn/gunicorn.service /etc/systemd/system/gunicorn.service

# Adjust permissions and ownership of the SQLite database
cd /home/ubuntu/peace_online
sudo chmod 664 db.sqlite3
sudo chown www-data:www-data db.sqlite3

# Start and enable the Gunicorn service
sudo systemctl start gunicorn.service
sudo systemctl enable gunicorn.service
