FROM ubuntu:precise

MAINTAINER Christian Elberfeld "elberfeld@web.de"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list.d/precise.list \ 
	&& apt-get update \
	&& apt-get install -y --no-install-recommends python-software-properties \
	&& add-apt-repository ppa:chris-lea/node.js && apt-get update \
	&& apt-get install -y git nodejs

RUN git clone https://github.com/prawnsalad/KiwiIRC.git kiwiirc

ADD config.js /kiwiirc/config.js

RUN cd kiwiirc && npm install && ./kiwi build

EXPOSE 7778

CMD /kiwiirc/kiwi -f


#FROM debian:jessie
#
#MAINTAINER Christian Elberfeld "elberfeld@web.de"
#
#FROM google/nodejs-runtime
#
#RUN ./kiwi build
#COPY config.js /var/KiwiIRC/
#
#EXPOSE 7778
#
#ENTRYPOINT ["./kiwi", "-f", "start", "-c", "config.js"]
#CMD ["-c", "config.js"]
#
#COPY sources.list /etc/apt/

## Update Debian and install Packages 
## Nginx Logs will be redirected to stdout and stderr
#RUN apt-get update && \
#    apt-get upgrade -y && \
#    apt-get install -y  git nodejs npm && \
#    ln -s /usr/bin/nodejs /usr/bin/node  
#
## Clone and Checkout GIT
# 
#RUN cd /var && \   
#    git clone http://github.com/prawnsalad/KiwiIRC.git && \
#	cd /var/KiwiIRC/ && \
#	git checkout de1607bf1e9ba4429a10f895a6ec45c54daa3161 
#   
## Copy FF-Map Config  
#COPY config.js /var/KiwiIRC/
#
## Buils KiwiIRC-Map 
#RUN cd /var/KiwiIRC && \ 
#    npm install && \
#    ./kiwi build 
#
#EXPOSE 7778
#
#CMD ["/var/KiwiIRC/kiwi", "-f", "start"]
#
