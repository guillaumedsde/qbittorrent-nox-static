#!/bin/sh

cd ~

# install build script dependencies
apk add --no-cache bash wget curl

# download build script
wget -qO ~/qbittorrent-nox-static-musl.sh https://git.io/JvLcZ
chmod 700 ~/qbittorrent-nox-static-musl.sh

# install build dependencies
~/qbittorrent-nox-static-musl.sh

# build static qbittorrent binary
~/qbittorrent-nox-static-musl.sh all

# install static qbittorrent binary to /usr/local/bin
~/qbittorrent-nox-static-musl.sh install

# copy built binary to the build volume
cp /usr/local/bin/qbittorrent-nox /build || :
cp /usr/local/qbittorrent-nox /build || :
