#!/bin/bash 

# Stop Docker Containder if running 
docker stop dokuwiki 

# Remove docker Container if existing 
docker rm dokuwiki

# Build Docker Container 
docker build --force-rm -t dokuwiki .  

# Setup and Rund Docker Container 
docker run --name=dokuwiki --restart=always -d -p 127.0.0.1:8081:80 -v /var/data/dokuwiki:/var/www/html dokuwiki 


