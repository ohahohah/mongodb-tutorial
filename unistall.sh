#!/bin/bash
sudo service mongod stop
sudo apt-get purge -y mongodb-org*
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb
rm /tmp/mongodb-27017.sock
