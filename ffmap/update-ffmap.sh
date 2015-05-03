#!/bin/bash
#
# Shellscript zum Aufruf von Bat2Nodes mit entsprechenden Parametern
# 

set -e
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

cd /tmp

# FFMap Backend ausführen, Daten werden in /var/www/map/rawdata geschrieben 
/usr/bin/python3 /var/ffmap-backend/backend.py -d /var/www/map/rawdata/ -a /var/services-ffms/ffmap/aliases_gateways.json --vpn de:ad:be:ef:43:02 de:ad:be:ef:43:03 de:ad:be:ef:43:04 de:ad:be:ef:43:05 de:ad:be:ef:43:06 de:ad:be:ef:43:07 de:ad:be:ef:43:08 de:ad:be:ef:43:09

# Aus der Nodes.json die Owner Informationen entfernen 
jq '.nodes = (.nodes | with_entries(del(.value.nodeinfo.owner)))' < /var/www/map/rawdata/nodes.json > /var/www/map/build/data/nodes.json

# Restliche Daten kopieren 
cp /var/www/map/rawdata/graph.json /var/www/map/build/data/
cp /var/www/map/rawdata/nodelist.json /var/www/map/build/data/
