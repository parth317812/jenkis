#!/bin/bash

sudo cp -rf app.conf /etc/nginx/sites-available/app
sudo chmod 710 /var/lib/jenkins/workspace/jenkins-django
cd /etc/nginx/sites-available
sudo ln -s /etc/nginx/sites-available/app /etc/nginx/sites-enabled/app
cd
sudo nginx -t

sudo systemctl start nginx
sudo systemctl enable nginx

echo "nginx has been started"

sudo systemctl status nginx