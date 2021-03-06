#!/bin/bash 

# Stop Docker Container if running 
docker stop grafana

# Remove Docker Container if existing 
docker rm grafana

# Setup and Rund Docker Container 
docker run --name=grafana --restart=always -d -p 127.0.0.1:8086:3000 -v /var/data/grafana/:/var/lib/grafana -e "GF_SERVER_ROOT_URL=https://freifunk-muensterland.de/grafana/" -e "GF_USERS_ALLOW_SIGN_UP=false" -e "GF_USERS_ALLOW_ORG_CREATE=false" -e "GF_AUTH_ANONYMOUS_ENABLED=true" -e "GF_SESSION_PROVIDER=memory" -e "GF_ANALYTICS_REPORTING_ENABLED=false" grafana/grafana:2.6.0 


