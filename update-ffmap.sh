#!/bin/bash
#
# Shellscript zum Aufruf von Bat2Nodes mit entsprechenden
# Parametern

set -e
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

/usr/bin/python3 /var/ffmap-backend/bat2nodes.py -A -o -a /var/ffmap-backend/aliases_gateways.json -d /var/ffmap-d3/