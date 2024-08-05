#!/bin/bash

echo '[+] Starting apache'
sudo service apache2 start

while true
do
    tail -f /var/log/apache2/*.log
    exit 0
done
