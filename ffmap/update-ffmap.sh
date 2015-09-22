#!/bin/bash
#
# Shellscript zum Aufruf von Bat2Nodes mit entsprechenden Parametern
# 

set -e
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

cd /var/ffmap-data

# FFMap Backend ausführen, Daten werden in /var/www/map/rawdata geschrieben 
/usr/bin/python3 /var/ffmap-backend/backend.py -d /var/ffmap-data -a /var/services-ffms/ffmap/aliases_gateways.json 

# Aus der Nodes.json die Owner Informationen entfernen 
jq '.nodes = (.nodes | with_entries(del(.value.nodeinfo.owner)))' < /var/ffmap-data/nodes.json > /var/www/map/data/nodes.json

# Restliche Daten kopieren 
cp /var/ffmap-data/graph.json /var/www/map/data/
cp /var/ffmap-data/nodelist.json /var/www/map/data/
