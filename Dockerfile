#
# DCS-docker Dockerfile
# Light edition
#

FROM ubuntu:22.04

LABEL maintainer="Deephack"

ENV DEBIAN_FRONTEND noninteractive

# default screen size
ENV XRES 1280x800x24

# default tzdata settings
ENV TZ Etc/UTC
ENV LANG en_GB.utf8

RUN apt update \
    && apt install -y --no-install-recommends software-properties-common curl \
    && apt update \
    && apt install -y --no-install-recommends --allow-unauthenticated \
        supervisor sudo net-tools zenity xz-utils wget gnupg2 software-properties-common \
        dbus-x11 x11-utils alsa-utils \
        mesa-utils libgl1-mesa-dri \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install -y --no-install-recommends --allow-unauthenticated \
        xvfb x11vnc openssh-server \
        vim-tiny firefox ttf-wqy-zenhei  \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /run/sshd

RUN apt update \
    && apt install -y xfce4 xfce4-terminal xfce4-xkb-plugin mousepad adwaita-icon-theme

## Add Wine

RUN dpkg --add-architecture i386
RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key ; apt-key add winehq.key ; apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ jammy main'
RUN apt update -y ; apt install -y --install-recommends winehq-devel

## Add XDoTool
RUN apt update \
    && apt install -y --no-install-recommends --allow-unauthenticated \
        xdotool \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY startup.sh /startup.sh

## Add default user
RUN adduser --disabled-password --gecos "" dcsuser
RUN echo "dcsuser:password" | /usr/sbin/chpasswd \
    && 	echo "dcsuser ALL=(ALL) ALL" >> /etc/sudoers

## Add DCS scripts
COPY dcs-install.sh /dcs-install.sh
COPY dcs-run.sh /dcs-run.sh
COPY DCS-Install.desktop /DCS-Install.desktop
COPY DCS-Run.desktop /DCS-Run.desktop

## Disable screenlocking
COPY xfce4-screensaver.xml /xfce4-screensaver.xml

## Config to autostart DCS
COPY supervisord.conf /etc/supervisord.conf

## exposed ports
EXPOSE 22 5900

ENTRYPOINT ["/startup.sh"]