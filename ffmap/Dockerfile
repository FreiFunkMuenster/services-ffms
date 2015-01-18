FROM debian:jessie

MAINTAINER Christian Elberfeld "elberfeld@web.de"

# Update Debian and install Packages 
# Nginx Logs will be redirected to stdout and stderr
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  nginx git nodejs npm && \
    ln -s /usr/bin/nodejs /usr/bin/node && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# Install NPM Packages 
RUN npm install -g grunt-cli bower 

# Checkout GIT
RUN cd /var && \   
    git clone https://github.com/ffnord/ffmap-d3.git 
   
# Copy FF-Map Config  
COPY config.json /var/ffmap-d3/

# Buils FF-Map 
RUN cd /var/ffmap-d3 && \ 
    npm install && \
    bower install --allow-root && \
    grunt && \
    cp /var/ffmap-d3/build /var/www/html/map -r && \
    chown www-data:www-data /var/www/html/ -R 

# Copy NGinx Config
COPY nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
