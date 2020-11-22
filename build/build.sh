#!/bin/sh

echo "building in $(pwd)"

# install build script dependencies
apk add --no-cache bash wget curl

# download build script
wget -qO ./qbittorrent-nox-static.sh https://git.io/JvLcZ
chmod 700 ./qbittorrent-nox-static.sh

# install build dependencies
./qbittorrent-nox-static.sh

# build static qbittorrent binary
./qbittorrent-nox-static.sh all -b "$(pwd)/qbittorrent-build"

# install static qbittorrent binary to /usr/local/bin
./qbittorrent-nox-static.sh install -b "$(pwd)/qbittorrent-build"

# copy built binary to the build volume
cp /usr/local/bin/qbittorrent-nox "$(pwd)"
