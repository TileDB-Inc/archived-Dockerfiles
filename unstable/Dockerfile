# Build and install the latest TileDB unstable (in-development)
# version.

# To build:
#   docker build -t tiledb:unstable
#
# Use the build arg 'enable' to configure optional TileDB components, e.g.:
#   docker build --build-arg enable=s3,hdfs -t tiledb:unstable

FROM tiledb:base

# Optional components to enable (defaults to empty).
ARG enable

RUN git clone https://github.com/TileDB-Inc/TileDB.git /home/tiledb/TileDB \
    && cd /home/tiledb/TileDB \
    && mkdir build \
    && cd build \
    && ../scripts/install-deps.sh --enable=${enable} \
    && ../bootstrap --prefix=/usr --enable=${enable} \
    && make \
    && make examples \
    && make install

RUN chown -R tiledb: /home/tiledb

EXPOSE 22

USER tiledb
WORKDIR /home/tiledb/TileDB
ENTRYPOINT /bin/bash
