#!/bin/bash

git clone https://github.com/TileDB-Inc/TileDB /tmp/TileDB
pushd /tmp/TileDB
git checkout dev
mkdir build
pushd build
../bootstrap --enable-verbose --prefix=/usr/local
make -j 4
make -C tiledb install
ldconfig
echo "Done."
