FROM archlinux

RUN pacman -Syu git base base-devel --noconfirm

RUN pacman -Syu python python-pip python-setuptools --noconfirm

RUN pacman -Syu cuda --noconfirm

RUN curl -sSf https://rye.astral.sh/get | X="y" RYE_INSTALL_OPTION="--yes" bash

WORKDIR /root

ADD . .

RUN source "$HOME/.rye/env"; rye sync
RUN source "$HOME/.rye/env"; rye run python src/tem/__init__.py
