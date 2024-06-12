#!/bin/bash

source env/bin/activate

cd /var/lib/jenkins/workspace/jenkins-django/app

python3 manage.py miakemigrations
python3 manage.py migrate


echo "migrations done"

cd /var/lib/jenkins/workspace/jenkins-django

sudo cp -rf gunicorn.socket /etc/systememd/system/
sudo cp -rf gunicorn.service /etc/systememd/system/

echo "$USER"
echo "$PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "gunicorn has been started"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn

