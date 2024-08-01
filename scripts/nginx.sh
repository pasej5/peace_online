
#!/usr/bin/bash

sudo systemctl daemon-reload
sudo rm -f /etc/nginx/sites-enabled/default

sudo cp /home/ubuntu/peace_online/nginx/nginx.conf /etc/nginx/sites-available/peace_online
sudo ln -s /etc/nginx/sites-available/peace_online /etc/nginx/sites-enabled/
#sudo ln -s /etc/nginx/sites-available/peace_online /etc/nginx/sites-enabled
#sudo nginx -t
sudo gpasswd -a www-data ubuntu
sudo systemctl restart nginx