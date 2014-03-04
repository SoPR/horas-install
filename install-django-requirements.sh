#!/bin/bash

# Setup horas requirements, syncdb and import fixtures

cd /home/vagrant/horas/static/src
npm install -g brunch
cd /home/vagrant/horas
sudo pip3.3 install -r requirements.txt
python3.3 manage.py syncdb
python3.3 manage.py migrate
python3.3 manage.py loaddata /home/vagrant/horas/apps/profiles/fixtures/admin.json
