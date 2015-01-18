#!/bin/bash

TEMPLATE="/var/services-ffms/apifile/ffapi-template.json"
APIFILE="/var/www/freifunk/ffapi.json"

NUMNODES=$(sh -c "/usr/sbin/batctl vd json; /usr/sbin/batadv-vis -f json" | grep -c '{ \"primary\" : .* }')

echo "$NUMNODES"

[[ $NUMNODES =~ ^[0-9]+$ ]] || exit 1

cat $TEMPLATE | sed 's/#NUMNODES#/$NUMNODES/' | sed 's/#LASTCHANGE#/$(date "+%Y-%m-%dT%T.%Z")/' > $APIFILE

