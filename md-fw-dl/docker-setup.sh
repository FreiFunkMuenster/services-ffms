#!/bin/bash 

# Stop Docker Container if running 
docker stop md-fw-dl

# Remove docker Container if existing 
docker rm md-fw-dl

# Build Docker Container 
docker build -t md-fw-dl .  

# Setup and Rund Docker Container 
docker run --name=md-fw-dl --restart=always -d -p 127.0.0.1:8085:80 md-fw-dl 



