#!/usr/bin/bash 

sed -i 's/\[]/\["13.48.217.164"]/' /home/ubuntu/peace_online/peace_online/settings.py

python3 manage.py migrate 
python3 manage.py makemigrations     
python3 manage.py collectstatic
sudo service gunicorn restart
sudo service nginx restart
#sudo tail -f /var/log/nginx/error.log
#sudo systemctl reload nginx
#sudo tail -f /var/log/nginx/error.log
#sudo nginx -t
#sudo systemctl restart gunicorn
#sudo systemctl status gunicorn
#sudo systemctl status nginx
# Check the status
#systemctl status gunicorn
# Restart:
#systemctl restart gunicorn
#sudo systemctl status nginx