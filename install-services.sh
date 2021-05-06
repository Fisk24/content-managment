#! /bin/bash

# Ensure that this command is run as root
if test `id -u` != "0"; then
	echo "This script must be run as root!"
	exit
fi

echo "Copying Systemd Unit..."
cp ./docker-compose@.service /etc/systemd/system/docker-compose@.service
echo "Copying docker-compose file..."
mkdir /etc/docker/compose/content-management
cp ./docker-compose.yml /etc/docker/compose/content-management/docker-compose.yml

systemctl daemon-reload
systemctl start docker-compose@content-management
systemctl enable docker-compose@content-management
