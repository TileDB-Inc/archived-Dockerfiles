# TileDB-Docker
Docker files for TileDB

To build:


    docker build -t tiledb:base base
    docker build -t tiledb:stable stable
    
To run:

    docker run -it tiledb:stable
    cd ./build/examples
    ./tiledb_version
