#!/bin/bash 
# 

set -e
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Generate Bind DB with Node Names 
python /var/services-ffms/dns/nodenames.py > /var/tmp/db.nodes.ffms.new
RETVAL=$?

if [ $RETVAL -eq 0 ] 
  then 

  # compare md5 sums 
  MD5OLD=`md5sum /var/tmp/db.nodes.ffms` 
  MD5NEW=`md5sum /var/tmp/db.nodes.ffms.new` 
  
  if [ "$MD5OLD" != "$MD5NEW" ] 
    then

    # Copy generated output 
    mv /var/tmp/db.nodes.ffms.new /var/tmp/db.nodes.ffms

    # Reload Bind9
    service bind9 reload
  fi 
  
  # cleanup 
  rm -f /var/tmp/db.nodes.ffms.new
  
fi 

