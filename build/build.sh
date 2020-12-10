#!/bin/sh

QBITTORRENT_VERSION=release-4.3.1
LIBTORRENT_VERSION=v2.0.1

echo "building in $(pwd)"

# install build script dependencies
apk add --no-cache bash wget curl

# download build script
wget -qO ./qbittorrent-nox-static.sh https://git.io/JvLcZ
chmod 700 ./qbittorrent-nox-static.sh

# install build dependencies and build static qbittorrent binary
./qbittorrent-nox-static.sh all -b "$(pwd)/qbittorrent-build" --libtorrent-tag "${LIBTORRENT_VERSION}" --qbittorrent-tag "${QBITTORRENT_VERSION}" --optimize

# install static qbittorrent binary to /usr/local/bin
./qbittorrent-nox-static.sh install -b "$(pwd)/qbittorrent-build"

# copy built binary to the build volume
cp /usr/local/bin/qbittorrent-nox "$(pwd)"
