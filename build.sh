#!/bin/bash

ROOT=$HOME/local

TMUX_SRC=tmux

NCURSES_SRC=ncurses

LIBEVENT_SRC=libevent

mkdir $ROOT

#unzip srcs

mkdir $ROOT/$TMUX_SRC
tar xzvf $TMUX_SRC.tar.gz -C $ROOT/$TMUX_SRC --strip-components 1
mkdir $ROOT/$NCURSES_SRC
tar xzvf $NCURSES_SRC.tar.gz -C $ROOT/$NCURSES_SRC --strip-components 1
mkdir $ROOT/$LIBEVENT_SRC
tar xzvf $LIBEVENT_SRC.tar.gz -C $ROOT/$LIBEVENT_SRC --strip-components 1

cd $ROOT

#install libevent
cd $LIBEVENT_SRC
$(./configure --prefix=$HOME/local)
make && make install
cd $ROOT

#install ncurses
cd $NCURSES_SRC
$(./configure --enable-pc-files --prefix=${HOME}/local --with-pkg-config-libdir=${HOME}/local/lib/pkgconfig --with-termlib)
make && make install
cd $ROOT

#install tmux
cd $TMUX_SRC
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$HOME/local/lib/pkgconfig"
$(./configure --prefix=$HOME/local)
make && make install
cd $ROOT
