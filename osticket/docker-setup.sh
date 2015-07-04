#!/bin/bash 

# Stop Docker Containder if running 
docker stop osticket-web 
docker stop osticket-db 

# Remove docker Container if existing 
docker rm osticket-web
docker rm osticket-db

# Build Docker Container
docker build -t osticket-web .

# Setup and Rund Docker Container 
docker run --name=osticket-db --restart=always -d -e MYSQL_ROOT_PASSWORD=osticket -e MYSQL_USER=osticket -e MYSQL_PASSWORD=osticket -e MYSQL_DATABASE=osticket -v /var/data/osticket-db:/var/lib/mysql mysql:5.5
docker run --name=osticket-web --restart=always -d -p 127.0.0.1:8084:80 -v /var/data/osticket-web:/data/upload/include/plugins --link osticket-db:mysql osticket-web 
 

