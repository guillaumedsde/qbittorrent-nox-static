#!/bin/sh

QBITTORRENT_VERSION=release-4.3.1
LIBTORRENT_VERSION=v2.0.1

echo "building qBittorrent ${QBITTORRENT_VERSION} with libtorrent ${LIBTORRENT_VERSION} in $(pwd)"

# install build script dependencies
apk add --no-cache bash wget curl

# download build script
wget -qO ./qbittorrent-nox-static.sh https://git.io/JvLcZ
chmod 700 ./qbittorrent-nox-static.sh

# install build dependencies
bash ./qbittorrent-nox-static.sh

# build static qbittorrent binary
bash ./qbittorrent-nox-static.sh all -b "$(pwd)/qbittorrent-build" --libtorrent-tag "${LIBTORRENT_VERSION}" --qbittorrent-tag "${QBITTORRENT_VERSION}" --optimize

# install static qbittorrent binary to /usr/local/bin
bash ./qbittorrent-nox-static.sh install -b "$(pwd)/qbittorrent-build"

# copy built binary to the build volume
cp /usr/local/bin/qbittorrent-nox "$(pwd)"
