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
~/qbittorrent-nox-static-musl.sh all -b "/root/qbittorrent-build"

# install static qbittorrent binary to /usr/local/bin
~/qbittorrent-nox-static-musl.sh install -b "/root/qbittorrent-build"

# copy built binary to the build volume
cp /usr/local/bin/qbittorrent-nox /build
