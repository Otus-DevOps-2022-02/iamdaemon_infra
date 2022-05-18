#!/bin/bash
while pgrep apt-get > /dev/null; do sleep 1; done
sudo apt-get update
while pgrep apt-get > /dev/null; do sleep 1; done
sudo apt-get install -y git
cd /home/ubuntu
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
echo '[Unit]
Description=Puma service
After=network.target
StartLimitIntervalSec=0
[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu/reddit
ExecStart=/usr/local/bin/puma
[Install]
WantedBy=multi-user.target' | sudo tee -a /etc/systemd/system/puma.service
sudo systemctl enable puma
