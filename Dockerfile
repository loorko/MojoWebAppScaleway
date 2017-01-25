FROM ubuntu:14.04
MAINTAINER Roland Goreczky

RUN apt-get update && apt-get install --yes \
	curl \
	build-essential \
	m4 \
	libncurses5-dev \
	libssh-dev \
	perl
RUN curl -s get.mojolicio.us | sh
VOLUME /var/log/docker
ADD . /srv/www

EXPOSE 8080

WORKDIR /srv/www/my_app

CMD hypnotoad -f script/my_app