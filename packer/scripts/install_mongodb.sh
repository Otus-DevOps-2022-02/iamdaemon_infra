#!/bin/bash
while pgrep apt-get > /dev/null; do sleep 1; done
apt-get update
while pgrep apt-get > /dev/null; do sleep 1; done
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
while pgrep apt-get > /dev/null; do sleep 1; done
apt-get update
while pgrep apt-get > /dev/null; do sleep 1; done
apt-get install -y mongodb-org
systemctl enable mongod
systemctl start mongod
