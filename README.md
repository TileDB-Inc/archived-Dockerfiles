# TileDB-Docker

[![Build Status](https://travis-ci.org/TileDB-Inc/TileDB-Docker.svg?branch=master)](https://travis-ci.org/TileDB-Inc/TileDB-Docker)

This repository contains the Docker files for TileDB.

Download prebuilt Docker images from Dockerhub:

https://hub.docker.com/r/tiledb/tiledb/

```
docker pull tiledb/tiledb:<version>
docker run -it tiledb/tiledb:<version>
```

## TileDB-Py

### Instructions

1. Install the Docker daemon from https://www.docker.com/community-edition

2. Clone the TileDB-Docker repo and build the images:
```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb:base base
docker build -t tiledb:release release
```

There is also a `tiledb:dev` image if you'd like the latest and
greatest (but potentially unstable) TileDB version.

To run:

    docker run -it tiledb:release

### Building with HDF Enabled

TileDB at complitation does not require libhdfs or any jvm component except
for unit tests. TileDB at runtime instead will `dlload` the needed `libhdfs`.
As a result if you want HDFS support you must use a separate docker image
which include the entire HDFS runtime as required

    docker build --build-arg enable=hdfs -t tiledb:release-hdfs release-hdfs

### Optional components

If you'd like to build TileDB with HDFS, use the `enable` build argument
when building the images, e.g.:

    docker build --build-arg enable=hdfs -t tiledb:release release

## TileDB-R

There is an image available for [TileDB-R](https://github.com/TileDB-Inc/TileDB-R)
which is used only for CI. This image is build and designed to facilitate CI.

### Instructions

1. Install the Docker daemon from https://www.docker.com/community-edition

2. Clone the TileDB-Docker repo and build the images:
```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb:ci-r ci-r
```
