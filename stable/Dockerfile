# Build and install the latest tiledb stable release 

# To build run:
# docker build -t tiledb:stable

FROM tiledb:base

# Setup home environment
RUN useradd tiledb
RUN mkdir /home/tiledb 
ENV HOME /home/tiledb

RUN wget -P /home/tiledb https://github.com/Intel-HLS/TileDB/archive/0.5.0.tar.gz && \ 
    tar xf /home/tiledb/0.5.0.tar.gz -C /home/tiledb && \
    rm /home/tiledb/0.5.0.tar.gz && \ 
    cd /home/tiledb/TileDB-0.5.0 && \
    make -j$(nproc)
   
RUN chown -R tiledb: /home/tiledb

EXPOSE 22

USER tiledb
WORKDIR /home/tiledb/TileDB-0.5.0 
ENTRYPOINT /bin/bash
