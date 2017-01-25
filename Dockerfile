# Inherit from the Ubuntu Trusty image by Scaleway.
#   This image contains some Scaleway specific scripts
#   See https://github.com/scaleway/image-ubuntu/blob/master/14.04/Dockerfile
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)

# Prepare rootfs for image-builder.
#   This script prevent aptitude to run services when installed
RUN /usr/local/sbin/builder-enter

# Install packages
RUN apt-get update
RUN apt-get install -y curl build-essential m4 libncurses5-dev libssh-dev libdbi-perl libdbd-mysql-perl libpq-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && apt-get install perl
#RUN curl get.mojolicio.us | sh
RUN curl -L https://cpanmin.us | perl - -M https://cpan.metacpan.org -n Mojolicious

VOLUME /var/log/docker
ADD . /srv/www
WORKDIR /srv/www/app

# Clean rootfs from image-builder.
#   Revert the builder-enter script
RUN /usr/local/sbin/builder-leave

CMD hypnotoad -f script/app