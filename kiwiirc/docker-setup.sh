#!/bin/bash 

# Stop Docker Containder if running 
docker stop kiwiirc

# Remove docker Container if existing 
docker rm kiwiirc

# Build Docker Container 
docker build -t kiwiirc .  

# Setup and Rund Docker Container 
# Double mounting of volumes is needed, otherwise no data is written by carbon-cache
docker run --name=kiwiirc --restart=always -d --net="host" -p 127.0.0.1:7778:7778 kiwiirc 



