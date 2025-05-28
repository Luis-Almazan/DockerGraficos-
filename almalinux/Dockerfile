FROM almalinux:latest
#Instalado de paquetes
RUN dnf update -y && dnf install -y vim git net-tools sudo zsh unzip nano nmap wget passwd
RUN dnf install -y epel-release && \
    dnf groupinstall -y "Xfce" && \
    dnf install -y dbus-x11 xorg-x11-server-Xorg && \
    dnf install -y tigervnc-server
# 
RUN mkdir -p /var/lib/dbus
RUN dbus-uuidgen --ensure
# Crear usuario y grupo
RUN groupadd utiger
RUN useradd -s /bin/bash -g utiger -m  -G wheel utiger
# Instalar entorno de escritorio y VNC
RUN mkdir -p /home/utiger/.vnc
RUN chown -R utiger:utiger /home/utiger/.vnc
COPY xstartup /home/utiger/.vnc/
# Cambiar permisos del archivo xstartup
RUN chmod +x /home/utiger/.vnc/xstartup && chown utiger:utiger /home/utiger/.vnc/xstartup
#AnyDesk
RUN dnf -y update && \
    dnf -y install wget gnupg && \
    printf "[anydesk]\n\
name=AnyDesk Fedora - stable\n\
baseurl=http://rpm.anydesk.com/fedora/\$basearch/\n\
gpgcheck=1\n\
repo_gpgcheck=1\n\
gpgkey=https://keys.anydesk.com/repos/RPM-GPG-KEY\n" \
    > /etc/yum.repos.d/AnyDesk-Fedora.repo && \
    dnf -y install anydesk && \
    dnf clean all
