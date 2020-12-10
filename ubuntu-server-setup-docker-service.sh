#! /bin/bash

# Ensure that this command is run as root
if test `id -u` != "0"; then
	echo "This script must be run as root!"
	exit
fi

# Install docker
apt-get update
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add –
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
apt-get update
sudo apt install docker-ce docker-ce-cli containerd.io

#install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#ensure that the services are started/enabled
systemctl start docker.service
systemctl enable docker.service

echo "Job Completed!"
echo "The Docker service should now be installed and running. To check that it is running use:"
echo "sudo systemctl list-units --type=service --state=active | grep docker.service"
