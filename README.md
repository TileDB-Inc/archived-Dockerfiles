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
docker build -t tiledb/tiledb:base base
docker build -t tiledb/tiledb:release release
```

There is also a `tiledb:dev` image if you'd like the latest and
greatest (but potentially unstable) TileDB version.

To run:

    docker run -it tiledb/tiledb:release

### Optional components

If you'd like to build TileDB with HDFS, use the `enable` build argument
when building the images, e.g.:

    docker build --build-arg enable=hdfs -t tiledb/tiledb:release

## TileDB-R

There is two images available for [TileDB-R](https://github.com/TileDB-Inc/TileDB-R).

### User Image

The user image is meant for end users to be able to use TileDB-R.

#### Instructions

1. Install the Docker daemon from https://www.docker.com/community-edition

2. Clone the TileDB-Docker repo and build the images:
```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb/tiledb-r r
```

### CI Image

The CI image is setup for unit testing via CI.

#### Instructions

1. Install the Docker daemon from https://www.docker.com/community-edition

2. Clone the TileDB-Docker repo and build the images:
```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb/ci-r ci-r
```
