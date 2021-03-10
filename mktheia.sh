#!/bin/sh
cd "$(dirname "$0")"
docker run -e EXPORT_PKG=1 -v $PWD:/pkg makepkg
