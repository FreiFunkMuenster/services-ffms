FROM ubuntu:precise

MAINTAINER Christian Elberfeld "elberfeld@web.de"

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list.d/precise.list \ 
	&& apt-get update \
	&& apt-get install -y --no-install-recommends python-software-properties \
	&& add-apt-repository ppa:chris-lea/node.js && apt-get update \
	&& apt-get install -y git nodejs

RUN git clone https://github.com/prawnsalad/KiwiIRC.git kiwiirc
RUN cd kiwiirc && git checkout v0.9.1

ADD config.js /kiwiirc/config.js

RUN cd kiwiirc && npm install && ./kiwi build

EXPOSE 7778

CMD /kiwiirc/kiwi -f

