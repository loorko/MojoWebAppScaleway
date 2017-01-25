FROM ubuntu:14.04
MAINTAINER Roland Goreczky
ENV REFRESHED_AT 2017-01-25

RUN /usr/local/sbin/builder-enter

RUN apt-get update

VOLUME /var/log/docker
ADD . /srv/www

EXPOSE 8080

WORKDIR /srv/www/app

RUN /usr/local/sbin/builder-leave

CMD hypnotoad -f script/app