#!/bin/bash
set -e

echo "Creating 2GB swap file..."
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

echo "Updating packages..."
apt-get update -y

echo "Installing unzip..."
apt-get install -y unzip 

echo "Installing Docker..."
apt-get install -y docker.io

echo "Starting Docker service..."
systemctl start docker
systemctl enable docker

echo "Installing Docker Compose..."
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Creating Docker CLI plugins directory..."
mkdir -p /usr/libexec/docker/cli-plugins
ln -sf /usr/local/bin/docker-compose /usr/libexec/docker/cli-plugins/docker-compose

echo "Installing AWS CLI v2 (lightweight)..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip aws/

echo "Adding ubuntu user to docker group..."
usermod -aG docker ubuntu

echo "User data script completed successfully!"