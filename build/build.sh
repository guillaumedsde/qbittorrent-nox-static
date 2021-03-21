#!/bin/sh
set -x
QBITTORRENT_VERSION=release-4.3.3
LIBTORRENT_VERSION=v2.0.2

echo "building qBittorrent ${QBITTORRENT_VERSION} with libtorrent ${LIBTORRENT_VERSION} in $(pwd)"

# install build script dependencies
apk add --no-cache bash wget curl

# build static qbittorrent binary
chmod 700 ./qbittorrent-nox-static.sh
./qbittorrent-nox-static.sh all -b "$(pwd)/qbittorrent-build" --libtorrent-tag "${LIBTORRENT_VERSION}" --qbittorrent-tag "${QBITTORRENT_VERSION}"

# install static qbittorrent binary to /usr/local/bin
./qbittorrent-nox-static.sh install -b "$(pwd)/qbittorrent-build"

# copy built binary to the build volume
cp /usr/local/bin/qbittorrent-nox "$(pwd)"
