#!/bin/bash 

# Stop Docker Containder if running 
docker stop graphite

# Remove docker Container if existing 
docker rm graphite

# Build Docker Container 
docker build -t graphite .  

# Setup and Rund Docker Container 
# Double mounting of volumes is needed, otherwise no data is written by carbon-cache
docker run --name=graphite --restart=always -d -m 2g -p 127.0.0.1:8083:8000  -p 10.43.0.12:2003:2003 -p 10.43.0.12:2004:2004 -v /var/data/graphite:/var/lib/graphite/storage -v /var/data/graphite/whisper:/var/lib/graphite/storage/whisper graphite 


