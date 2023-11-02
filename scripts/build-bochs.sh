#!/usr/bin/env bash
PREFIX=/opt/bochs
FILEGZ="$HOME/down/bochs-2.7.tar.gz"

sudo apt-get install libsdl2-dev curl

if [ ! -f $FILEGZ ]; then
    curl https://jaist.dl.sourceforge.net/project/bochs/bochs/2.7/bochs-2.7.tar.gz -o $FILEGZ
fi

mkdir -p ~/build
cd ~/build

tar xzvf $FILEGZ
cd bochs-2.7

./configure --prefix=$PREFIX \
            --enable-smp \
            --enable-cpu-level=6 \
            --enable-fpu \
            --enable-x86_64 \
            --enable-vmx \
            --enable-svm \
            --enable-avx \
            --enable-all-optimizations \
            --enable-debugger \
            --enable-debugger-gui \
            --enable-x86-debugger \
            --enable-iodebug \
            --enable-logging \
            --enable-ne2000 \
            --enable-cdrom \
            --disable-plugins \
            --disable-docbook \
            --with-x --with-x11 --with-term

make

sudo make install
