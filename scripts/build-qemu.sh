#!/usr/bin/env bash
VERSION=5.2.0
# VERSION=2.3.0
PREFIX=/opt/qemu
FILEGZ="$HOME/down/qemu-${VERSION}.tar.xz"

if [ ! -f $FILEGZ ]; then
    curl https://download.qemu.org/qemu-${VERSION}.tar.xz -o $FILEGZ
fi

# https://wiki.qemu.org/Hosts/Linux
sudo apt-get install -y git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev ninja-build \
     git-email \
     libaio-dev libbluetooth-dev libcapstone-dev libbrlapi-dev libbz2-dev \
     libcap-ng-dev libcurl4-gnutls-dev libgtk-3-dev \
     libibverbs-dev libjpeg8-dev libncurses5-dev libnuma-dev \
     librbd-dev librdmacm-dev \
     libsasl2-dev libsdl2-dev libseccomp-dev libsnappy-dev libssh-dev \
     libvde-dev libvdeplug-dev libvte-2.91-dev libxen-dev liblzo2-dev \
     valgrind xfslibs-dev \
     libnfs-dev libiscsi-dev


cd ~/build
rm -rf qemu-*
tar xvf $FILEGZ
mkdir qemu-build-${VERSION}
cd qemu-build-${VERSION}

CFG_EXTRA=""
if [ X"$VERSION" == "2.3.0"]; then
    CFG_EXTRA="--python=/usr/bin/python2"
fi

echo "configure"
../qemu-${VERSION}/configure --prefix=/opt/qemu-${VERSION} $CFG_EXTRA

echo "make"
make -j$(nproc)
make install
