#!/bin/bash

I=`dpkg -s mongodb-org | grep "Status" `
if [ -n "$I" ]
then
   echo $I" already installed"
   exit 0
else
   echo $I" not installed"
   wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
   sudo bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
   sudo apt update
   sudo apt install -y mongodb-org
   sudo systemctl start mongod
   sudo systemctl enable mongod
fi
