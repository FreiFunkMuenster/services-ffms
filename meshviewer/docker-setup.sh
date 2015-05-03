#!/bin/bash 

# Stop Docker Containder if running 
docker stop meshviewer 

# Remove docker Container if existing 
docker rm meshviewer

# Build Docker Container 
docker build -t meshviewer .

# Setup and Rund Docker Container 
docker run --name=meshviewer --restart=always -d -p 127.0.0.1:8080:80 meshviewer 

