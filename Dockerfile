FROM qbbproject/archlinux-minimal

MAINTAINER Christopher Hinz <hinz@theo-physik.uni-kiel.de>

LABEL revision="4"

RUN pacman --noconfirm -Sy archlinux-keyring base-devel && pacman --noconfirm -Syu && pacman-db-upgrade && sudo paccache -k 0 -r -v

RUN groupadd sudo

COPY sudoers /etc/sudoers

RUN groupadd electron && useradd -m -g electron -G sudo -s /bin/bash electron

USER electron

RUN cd /tmp && curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz && tar -xvzf package-query.tar.gz && cd package-query && makepkg --noconfirm -si
RUN cd /tmp && curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz && tar -xvzf yaourt.tar.gz && cd yaourt && makepkg --noconfirm -si
