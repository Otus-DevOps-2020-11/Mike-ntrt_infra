#!/bin/bash
apt install -yq apt-transport-https libcurl3-gnutls ca-certificates
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update && apt-get install -yq mongodb-org
systemctl start mongod
systemctl enable mongod
