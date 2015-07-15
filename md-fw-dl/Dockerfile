FROM nginx:1.9.2

MAINTAINER Christian Elberfeld "elberfeld@web.de"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y --no-install-recommends git 

RUN cd /usr/share/nginx/html  \  
     	&& git clone https://github.com/FreiFunkMuenster/md-fw-dl.git 

EXPOSE 80 

CMD ["nginx", "-g", "daemon off;"]


