#!/usr/bin/env bash
PREFIX=/opt/bochs-2.7
FILEGZ="$HOME/down/bochs-2.7.tar.gz"

sudo apt-get install libsdl2-dev xorg-dev curl

if [ ! -f $FILEGZ ]; then
    curl https://jaist.dl.sourceforge.net/project/bochs/bochs/2.7/bochs-2.7.tar.gz -o $FILEGZ
fi

mkdir -p ~/build
cd ~/build

rm -rf bochs-2.7

tar xzvf $FILEGZ
mv bochs-2.7 bochs-2.7-gdb
cd bochs-2.7-gdb

./configure --prefix=$PREFIX-gdb \
            --enable-cpu-level=6 \
            --enable-fpu \
            --enable-x86_64 \
            --enable-vmx \
            --enable-svm \
            --enable-avx \
            --enable-all-optimizations \
            --enable-gdb-stub \
            --enable-debugger-gui \
            --enable-x86-debugger \
            --enable-iodebug \
            --enable-logging \
            --enable-ne2000 \
            --enable-cdrom \
            --disable-plugins \
            --disable-docbook \
            --with-x11

make -j$(nproc)

sudo make install

cd ~/build
tar xzvf $FILEGZ
mv bochs-2.7 bochs-2.7-native
cd bochs-2.7-native

./configure --prefix=$PREFIX-native \
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
            --with-x11

make -j$(nproc)

sudo make install
