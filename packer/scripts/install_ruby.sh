#!/bin/bash
while pgrep apt-get > /dev/null; do sleep 1; done
apt-get update
while pgrep apt-get > /dev/null; do sleep 1; done
apt-get install -y ruby-full ruby-bundler build-essential
