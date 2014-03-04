#!/bin/bash

sudo apt-get -y install libpq-dev postgresql redis-server

# PostgreSQL setup
sudo -u postgres createdb development
sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'password';"
echo "listen_addresses = '*'" | sudo -u postgres tee -a /etc/postgresql/9.1/main/postgresql.conf
echo "host all all 0.0.0.0/0 md5" | sudo -u postgres tee -a /etc/postgresql/9.1/main/pg_hba.conf
sudo service postgresql restart

# Redis setup

sudo sed -i 's/bind 127.0.0.1/# bind 127.0.0.1/g' /etc/redis/redis.conf
sudo echo 'vm.overcommit_memory = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl vm.overcommit_memory=1
sudo service redis-server restart
