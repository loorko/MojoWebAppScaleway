# Inherit from the Ubuntu Trusty image by Scaleway.
#   This image contains some Scaleway specific scripts
#   See https://github.com/scaleway/image-ubuntu/blob/master/14.04/Dockerfile
FROM scaleway/ubuntu:trusty
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder.
#   This script prevent aptitude to run services when installed
RUN /usr/local/sbin/builder-enter


# Install packages
RUN apt-get -q update && \
    apt-get -y -qq upgrade && \
    apt-get install -y -qq cowsay


# Add local files from the patches directory
COPY ./patches/ /


# Clean rootfs from image-builder.
#   Revert the builder-enter script
RUN /usr/local/sbin/builder-leave