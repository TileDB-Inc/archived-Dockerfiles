# TileDB-Docker

[![Build Status](https://travis-ci.org/TileDB-Inc/TileDB-Docker.svg?branch=master)](https://travis-ci.org/TileDB-Inc/TileDB-Docker)

This repository contains the Docker files for TileDB.

## Instructions

1. Install the Docker daemon from https://www.docker.com/community-edition

2. Clone the TileDB-Docker repo and build the images:
```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb:base base
docker build -t tiledb:stable stable
```

There is also a `tiledb:unstable` image if you'd like the latest and
greatest (but potentially unstable) TileDB version, and a `tiledb:dev`
image intended for TileDB developers.

To run:

    docker run -it tiledb:stable
    cd ./build/examples
    ./tiledb_version

## Optional components

If you'd like to build TileDB with optional components such as HDFS or
S3 support, use the `enable` build argument when building the images,
e.g.:

    docker build --build-arg enable=s3,hdfs -t tiledb:stable