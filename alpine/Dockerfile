FROM alpine:latest
#Instalado de paquetes
RUN apk update && apk add vim git curl net-tools sudo zsh unzip nano  nmap iputils-ping shadow
#RUN apk add --no-cache lxde-common lxdm dbus-x11 xf86-video-vesa xorg-server xfce4-terminal
#RUN apk add tigervnc lxqt-desktop lximage
#
RUN apk update && apk add --no-cache \
  openbox \
  tigervnc \
  xterm \
  dbus \
  xauth \
  ttf-dejavu \
  bash \
  sudo
# Dependencias 
RUN apk add galculator font-misc-misc  adwaita-icon-theme gtk+3.0
RUN apk add tint2 xterm xsetroot
# Librerias Python 
RUN apk add py3-pip py3-setuptools python3
RUN pip install pyxdg --break-system-packages

ENV USER=utiger \
    PASSWORD=Luis123

RUN adduser -D -s /bin/bash $USER && \
    echo "$USER:$PASSWORD" | chpasswd


RUN mkdir -p /home/$USER/.vnc && \
    chown -R $USER:$USER /home/$USER/.vnc && \
    echo $PASSWORD | vncpasswd -f > /home/$USER/.vnc/passwd && \
    chmod 600 /home/$USER/.vnc/passwd

# Script para iniciar LXDE y VNC
RUN echo "exec startlxde" > /home/$USER/.xinitrc && \
    chown $USER:$USER /home/$USER/.xinitrc

COPY .xinitrc /home/utiger/
COPY .xsession /home/utiger/
RUN chmod u+x /home/utiger/.xinitrc && chmod u+x /home/utiger/.xsession 
RUN chown utiger:utiger /home/utiger/.xinitrc  && chown utiger:utiger /home/utiger/.xsession 
