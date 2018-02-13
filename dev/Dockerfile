# Build and install the latest TileDB development version. This image
# is intended for use in developing TileDB. For a bleeding-edge user
# image, use the 'tiledb:unstable' image instead.

# To build:
#   docker build -t tiledb:dev
#
# Use the build arg 'enable' to configure optional TileDB components, e.g.:
#   docker build --build-arg enable=s3,hdfs -t tiledb:dev

FROM tiledb:base

# Optional components to enable (defaults to empty).
ARG enable

RUN git clone https://github.com/TileDB-Inc/TileDB.git /home/tiledb/TileDB \
    && cd /home/tiledb/TileDB \
    && mkdir build \
    && cd build \
    && ../scripts/install-deps.sh --enable=${enable} \
    && ../bootstrap --enable-debug --enable-verbose --enable=${enable} \
    && make \
    && make examples \
    && make install \
    && echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/tiledb/TileDB/dist/lib' >> /home/tiledb/.bashrc

RUN chown -R tiledb: /home/tiledb

EXPOSE 22

USER tiledb
WORKDIR /home/tiledb/TileDB
ENTRYPOINT /bin/bash
