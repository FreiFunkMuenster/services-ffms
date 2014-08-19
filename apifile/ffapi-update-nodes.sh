#!/bin/bash

APIFILE="/var/www/wordpress/ressources/ffapi.json"
NUMNODES=$(sh -c "batctl vd json; batadv-vis -f json" | grep -c '{ \"primary\" : .* }')

echo "$NUMNODES"

[[ $NUMNODES =~ ^[0-9]+$ ]] || exit 1

grep -q '^    "nodes":.*,$' "$APIFILE" || ! grep -q '^  "state": {$' "$APIFILE" || \
	sed -i 's/^  "state": {/  "state": {\n    "nodes": 0,/' "$APIFILE"

sed -i "s/^    \"nodes\": .*/    \"nodes\": $NUMNODES,/;\
	s/^    \"lastchange\": .*/    \"lastchange\": $(date "+%s")/" \
		"$APIFILE"
