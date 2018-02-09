# Build and install the latest TileDB stable release 

# To build:
#   docker build -t tiledb:stable
#
# Use the build arg 'enable' to configure optional TileDB components, e.g.:
#   docker build --build-arg enable=s3,hdfs -t tiledb:stable

FROM tiledb:base

# Setup home environment
RUN useradd tiledb
RUN mkdir /home/tiledb 
ENV HOME /home/tiledb

# Optional components to enable (defaults to empty).
ARG enable
# Stable version number of TileDB to install.
ARG version=1.2.0

RUN wget -P /home/tiledb https://github.com/TileDB-Inc/TileDB/archive/${version}.tar.gz \
    && tar xzf /home/tiledb/${version}.tar.gz -C /home/tiledb \
    && rm /home/tiledb/${version}.tar.gz \
    && cd /home/tiledb/TileDB-${version} \
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
WORKDIR /home/tiledb/TileDB-${version}
ENTRYPOINT /bin/bash
