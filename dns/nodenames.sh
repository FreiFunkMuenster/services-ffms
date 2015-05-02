#!/bin/bash 
# 

set -e
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Generate Bind DB with Node Names 
python /var/dns/services-ffms/nodenames.py > /var/tmp/db.nodes.ffms.new
RETVAL=$?

if [ $RETVAL -eq 0 ] 
  then 

  # compare md5 sums 
  MD5OLD=`/var/tmp/db.nodes.ffms` 
  MD5NEW=`/var/tmp/db.nodes.ffms.new` 
  
  if [ $MD5OLD -ne $MD5NEW ] 
    then

    # Copy generated output 
    mv /var/tmp/db.nodes.ffms.new /var/tmp/db.nodes.ffms

    # Reload Bind9
    service bind9 reload
  fi 
  
  # cleanup 
  rm /var/tmp/db.nodes.ffms.new
  
fi 

