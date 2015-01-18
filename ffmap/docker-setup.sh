#!/bin/bash 

# Stop Docker Containder if running 
docker stop ffmap 

# Remove docker Container if existing 
docker rm ffmap 

# Build Docker Container 
docker build -t ffmap .

# Setup and Rund Docker Container 
docker run --name=ffmap --restart=always -d -p 8080:80 ffmap 

