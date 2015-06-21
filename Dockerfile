#
# Dockerfile to build an Xrfb compatible libreoffice desktop.
#
#
#
FROM phusion/baseimage:0.9.16

MAINTAINER John Dougan <void.random@gmail.com>
#derived from the dockerfiles by jfrazetta

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# setup for all Xrfb apps
ENV XRFBRESX=1024 XRFBRESY=768 XRFBDEPTH=24
RUN mkdir -p /vnc
RUN mkdir -p /data
COPY vncpasswd /vnc/
COPY service.d /etc/service/
COPY my_init.d /etc/my_init.d/
RUN useradd -m user

VOLUME ["/data"]
VOLUME ["/home/user"]
EXPOSE 5900

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive \
	apt-get install -y \
	x11vnc \
	xbase-clients \
	xdg-utils \
	xvfb \
	libreoffice \
	&& rm -rf /var/lib/apt/lists/*

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*