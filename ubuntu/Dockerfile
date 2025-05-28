FROM ubuntu:latest
#Instalado de paquetes
USER root
# Instalar paquetes necesarios
RUN apt-get update && apt-get install -y vim git curl net-tools sudo zsh unzip nano nmap htop wget iputils-ping
# Instalar entorno de escritorio y VNC
RUN apt install -y cinnamon
RUN apt install -y dbus-x11 tigervnc-standalone-server tigervnc-common
# Crear usuario y grupo
RUN groupadd utiger
RUN useradd -s /bin/bash -g utiger -m  -G sudo utiger

#Intalacion de Any Desk
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY -o /etc/apt/keyrings/keys.anydesk.com.asc
RUN chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc
# Add the AnyDesk apt repository
RUN echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list > /dev/null
# Update apt caches and install the AnyDesk client
RUN apt update && apt install anydesk
