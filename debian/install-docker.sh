#!/bin/bash

# Reference: https://docs.docker.com/engine/install/ubuntu/ (Official Guide)
# Author: MANOVISHNU ADEPU (geekymano@gmail.com)
# Last Updated: 2025/02/16

# Usage: bash install-docker.sh

echo '----------------------- Updating package index -----------------------------'
sudo apt-get update -y

echo '----------------------- Installing required packages -----------------------------'
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo '----------------------- Adding Docker's official GPG key -----------------------------'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo '----------------------- Adding Docker's stable repository -----------------------------'
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo '----------------------- Updating package index again -----------------------------'
sudo apt-get update -y

echo '----------------------- Installing Docker -----------------------------'
sudo apt-get install -y docker.io

echo '----------------------- Enabling Docker to start on boot -----------------------------'
sudo systemctl enable docker

echo '----------------------- Starting Docker service -----------------------------'
sudo systemctl start docker

echo '----------------------- Installing Docker Compose -----------------------------'
DOCKER_COMPOSE_VERSION="1.29.2" # You can change this to the latest version
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo '----------------------- Applying executable permissions to Docker Compose -----------------------------'
sudo chmod +x /usr/local/bin/docker-compose

echo '----------------------- Verifying Docker installation -----------------------------'
sudo docker --version
echo '----------------------- Verifying Docker Compose installation -----------------------------'
docker-compose --version

echo '----------------------- Docker and Docker Compose installation completed successfully! -----------------------------'