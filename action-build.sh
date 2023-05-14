#!/usr/bin/env bash

set -e

target="${1:-release}"

export BUILD_UNIVERSAL=1

# preinstall
./action-install.sh

# build dependencies
make deps

# build Squirrel
make MACOSX_DEPLOYMENT_TARGET='13.0' "${target}"
# make ARCHS='arm64' MACOSX_DEPLOYMENT_TARGET='13.0' "${target}"

echo 'Installer package:'
find package -type f -name '*.pkg' -or -name '*.zip'
