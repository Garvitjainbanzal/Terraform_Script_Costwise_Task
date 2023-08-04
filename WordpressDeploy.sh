#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo yum install -y git
git clone https://github.com/docker-library/wordpress.git
cd wordpress
docker build -t my-wordpress-app .
docker run -p 80:80 -d my-wordpress-app