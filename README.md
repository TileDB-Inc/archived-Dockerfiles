# TileDB-Docker

[![Build Status](https://travis-ci.org/TileDB-Inc/TileDB-Docker.svg?branch=master)](https://travis-ci.org/TileDB-Inc/TileDB-Docker)


This repository contains Dockerfiles for TileDB supporting several
[prebuilt Docker images](https://hub.docker.com/r/tiledb/).

## TileDB Py

Python support is available via the main TileDB docker
image, [tiledb/tiledb](https://hub.docker.com/r/tiledb/tiledb).

```
docker pull tiledb/tiledb
docker run -it --rm tiledb/tiledb
```

## TileDB R

R support is available via the
[tiledb/tildb-r](https://hub.docker.com/r/tiledb/tiledb-r) container.

```
docker pull tiledb/tiledb-r
docker run -it --rm tiledb/tiledb-r
```

## TileDB R CI Images

For TileDB R a docker images is used for CI. This is available via
[tiledb/ci-r](https://hub.docker.com/r/tiledb/ci-r).

```
docker pull tiledb/ci-r
docker run -it --rm tiledb/ci-r
```


## Building From Source

This section contains the build instructions for
building the docker images from source
instead of using the prebuild dockerhub images.

### TileDB / TileDB Py

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

#### Optional Components

If you'd like to build TileDB with HDFS, use the `enable` build argument
when building the images, e.g.:

    docker build --build-arg enable=hdfs -t tiledb/tiledb:release

### TileDB R

```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb/tiledb-r r
```

### TileDB R CI Image

```
git clone https://github.com/TileDB-Inc/TileDB-Docker
cd TileDB-Docker
docker build -t tiledb/ci-r ci-r
```
