FROM debian:jessie

MAINTAINER Christian Elberfeld "elberfeld@web.de"

COPY sources.list /etc/apt/sources.list 

# Update Debian and install Packages 
# Nginx Logs will be redirected to stdout and stderr
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  nginx git nodejs npm ruby-sass && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Install NPM Packages 
RUN npm install -g grunt-cli bower 

# Clone and Checkout GIT
# 
RUN cd /var && \   
    git clone https://github.com/tcatm/meshviewer.git && \
	cd /var/meshviewer/ && \
	git checkout v3
   
# Copy Map Config  
COPY config.js /var/meshviewer/

# Buils Map 
RUN cd /var/meshviewer && \ 
    npm install && \
    bower install --allow-root && \
    grunt && \
    chown www-data:www-data /var/meshviewer/build -R
 

# Copy NGinx Config
COPY nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
