FROM ubuntu:14.04
MAINTAINER Roland Goreczky
ENV REFRESHED_AT 2017-01-25

RUN apt-get update  
RUN apt-get install -y curl build-essential m4 libncurses5-dev libssh-dev libdbi-perl libdbd-mysql-perl libpq-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*  
RUN apt-get update && apt-get install perl  
RUN curl get.mojolicio.us | sh  

VOLUME /var/log/docker
ADD . /srv/www

EXPOSE 8080

WORKDIR /srv/www/app

CMD hypnotoad -f script/app