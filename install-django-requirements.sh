#!/bin/bash

# Setup horas requirements, syncdb and import fixtures

cd /home/vagrant/horas/static/src
npm install
npm install -g brunch
cd /home/vagrant/horas
sudo pip install -r requirements.txt
python manage.py syncdb
python manage.py migrate
python manage.py loaddata /home/vagrant/horas/apps/profiles/fixtures/admin.json
