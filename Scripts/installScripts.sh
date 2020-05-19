#!/bin/bash
apt-get update
apt-get install python3-pip3 python3-dev nginx git -y
apt-get update
cd /ChatApp
pip3 install virtualenv
virtualenv venv
source /ChatApp/venv/bin/activate
pip3 install -r requirements.txt
pip3 install django bcrypt django-extensions
pip3 install gunicorn
cd fundoo/
python3 manage.py collectstatic --noinput
cp /ChatApp/Scripts/gunicorn.service /etc/systemd/system/
systemctl daemon-reload
systemctl start gunicorn
systemctl enable gunicorn
unlink /etc/nginx/sites-enabled/*
cp /ChatApp/Scripts/fundoo /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/fundoo /etc/nginx/sites-enabled
systemctl restart nginx
