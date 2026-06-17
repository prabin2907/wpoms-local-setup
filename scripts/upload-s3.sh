#!/bin/bash
set -e

echo "Generating final docker-compose.yml..."
sed -e "s|__ECR_REGISTRY__|$ECR_REGISTRY|g" docker-compose.ec2.yml > docker-compose.yml

echo "Uploading docker-compose.yml to S3..."
aws s3 cp docker-compose.yml s3://$S3_BUCKET/docker-compose.yml

echo "Upload complete!"