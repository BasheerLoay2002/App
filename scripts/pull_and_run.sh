#!/bin/bash
set -e

# Variables
APP_NAME=myapp
ECR_URI=741343967623.dkr.ecr.us-east-1.amazonaws.com/simple-docker-service-128321426d7b:latest

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 741343967623.dkr.ecr.us-east-1.amazonaws.com

docker stop $APP_NAME || true
docker rm $APP_NAME || true

docker pull $ECR_URI

docker run -d --name $APP_NAME -p 80:8000 $ECR_URI
