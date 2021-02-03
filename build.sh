#!/bin/bash

ROOT = $HOME/local

TMUX_SRC = tmux
TMUX_SRC_URL = https://github.com/tmux/tmux/releases/download/3.1c/tmux-3.1c.tar.gz

NCURSES_SRC = ncurses
NCURSES_SRC_URL = https://invisible-mirror.net/archives/ncurses/ncurses-6.2.tar.gz

LIBEVENT_SRC = libevent
LIBEVENT_SRC_URL = https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz

mkdir $ROOT

cd $ROOT

#download & unzip srcs

wget $TMUX_SRC_URL -O $TMUX_SRC.tar.gz
wget $NCURSES_SRC_URL -O $NCURSES_SRC.tar.gz
wget $LIBEVENT_SRC_URL -O $LIBEVENT_SRC.tar.gz

tar xzvf $TMUX_SRC.tar.gz -C $TMUX_SRC --strip-components 1
tar xzvf $NCURSES_SRC.tar.gz -C $NCURSES_SRC --strip-components 1
tar xzvf $LIBEVENT_SRC.tar.gz -C $LIBEVENT_SRC --strip-components 1

#install libevent
cd $LIBEVENT_SRC
$(./configure --prefix=$HOME/local)
make && make install
cd $ROOT

#install ncurses
cd $NCURSES_SRC
$(./configure --enable-pc-files --prefix=$HOME/local --with-pkg-config-libdir=$HOME/local/lib/lib/pkgconfig --with-termlib)
make && make install
cd $ROOT

#install tmux
export PKG_CONFIG_PATH="${HOME}/local/lib/pkgconfig"
$(./configure --prefix=$HOME/app LDFLAGS="-L$HOME/app/lib" CFLAGS="-I$HOME/app/include")
make && make install
cd $ROOT
