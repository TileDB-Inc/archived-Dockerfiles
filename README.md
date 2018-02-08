# TileDB-Docker

[![Build Status](https://travis-ci.org/TileDB-Inc/TileDB-Docker.svg?branch=master)](https://travis-ci.org/TileDB-Inc/TileDB-Docker)

Docker files for TileDB

Install the Docker daemon:

https://www.docker.com/community-edition

Checkout the TileDB-Docker repo:

    git clone https://github.com/TileDB-Inc/TileDB-Docker
    cd TileDB-Docker

To build:


    docker build -t tiledb:base base
    docker build -t tiledb:stable stable
    
To run:

    docker run -it tiledb:stable
    cd ./build/examples
    ./tiledb_version
