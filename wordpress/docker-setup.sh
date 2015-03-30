#!/bin/bash 

# Stop Docker Containder if running 
docker stop wordpress-web 
docker stop wordpress-db 

# Remove docker Container if existing 
docker rm wordpress-web
docker rm wordpress-db

# Build Docker Container 
docker build -t wordpress-web .  

# Setup and Rund Docker Container 
docker run --name=wordpress-db --restart=always -d -v /var/data/wordpress-db:/var/lib/mysql mysql:5.5 
docker run --name=wordpress-web --restart=always -d -p 127.0.0.1:8082:80 -v /var/data/wordpress-web:/var/www/html --link wordpress-db:db wordpress-web 


