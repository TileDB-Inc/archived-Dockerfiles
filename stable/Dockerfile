# Build and install the latest tiledb stable release 

# To build run:
# docker build -t tiledb:stable

FROM tiledb:base

# Setup home environment
RUN useradd tiledb
RUN mkdir /home/tiledb 
ENV HOME /home/tiledb

RUN cmake --version

RUN wget -P /home/tiledb https://github.com/TileDB-Inc/TileDB/archive/1.1.0.tar.gz \
    && tar xzf /home/tiledb/1.1.0.tar.gz -C /home/tiledb \
    && rm /home/tiledb/1.1.0.tar.gz \
    && cd /home/tiledb/TileDB-1.1.0 \
    && mkdir build \
    && cd build \
    && ../bootstrap \
    && make \
    && make examples \
    && make install
   
RUN chown -R tiledb: /home/tiledb

EXPOSE 22

USER tiledb
WORKDIR /home/tiledb/TileDB-1.1.0
ENTRYPOINT /bin/bash
