#!/bin/bash

if [ -n "$VNC_PASSWORD" ]; then
    echo -n "$VNC_PASSWORD" > /.password1
    x11vnc -storepasswd $(cat /.password1) /.password2
    chmod 400 /.password*
    export VNC_PASSWORD=
fi

USER=${USER:-root}
HOME=/root
if [ "$USER" != "root" ]; then
    echo "* enable custom user: $USER"
    useradd --create-home --shell /bin/bash --user-group --groups adm,sudo $USER
    if [ -z "$PASSWORD" ]; then
        echo "  set default password to \"ubuntu\""
        PASSWORD=ubuntu
    fi
    HOME=/home/$USER
    echo "$USER:$PASSWORD" | chpasswd
    chown -R $USER:$USER ${HOME}
    [ -d "/dev/snd" ] && chgrp -R adm /dev/snd
fi
sed -i -e "s|%USER%|$USER|" -e "s|%HOME%|$HOME|" /etc/supervisor/supervisord.conf
sed -i -e "s|notset|$WORKDIR|" /dcs-run.sh

# clearup
PASSWORD=
HTTP_PASSWORD=

sudo -u dcsuser mkdir -p /home/dcsuser/.config/xfce4/xfconf/xfce-perchannel-xml
sudo -u dcsuser cp /xfce4-screensaver.xml /home/dcsuser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-screensaver.xml
sudo -u dcsuser cp /dcs-install.sh /home/dcsuser/dcs-install.sh
sudo -u dcsuser cp /dcs-run.sh /home/dcsuser/dcs-run.sh
sudo -u dcsuser mkdir /home/dcsuser/Desktop
sudo -u dcsuser cp /DCS-Install.desktop /home/dcsuser/Desktop/DCS-Install.desktop
sudo -u dcsuser cp /DCS-Run.desktop /home/dcsuser/Desktop/DCS-Run.desktop
sudo -u dcsuser cp /lotatc-install.sh /home/dcsuser/lotatc-install.sh
sudo -u dcsuser cp /LotAtc-Install.desktop /home/dcsuser/Desktop/LotAtc-Install.desktop
sudo -u dcsuser cp /dcs-world-server.yml /home/dcsuser/dcs-world-server.yml

exec /usr/bin/supervisord -n -c /etc/supervisord.conf