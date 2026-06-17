#!/bin/bash
set -e

ECR_REGISTRY="924982554051.dkr.ecr.ap-south-1.amazonaws.com"

echo "Downloading docker-compose.yml from S3..."
aws s3 cp s3://$S3_BUCKET/docker-compose.yml /home/ubuntu/app/docker-compose.yml

cd /home/ubuntu/app

echo "Logging in to ECR..."
aws ecr get-login-password --region $AWS_REGION | sudo docker login --username AWS --password-stdin $ECR_REGISTRY

echo "Stopping old containers..."
sudo docker-compose down || true

echo "Pulling latest images..."
sudo docker-compose pull

echo "Starting new containers..."
sudo docker-compose up -d