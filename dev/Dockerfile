# Build and install the latest TileDB development version. This image
# is intended for use in developing TileDB. For a bleeding-edge user
# image, use the 'tiledb:unstable' image instead.

# To build:
#   docker build -t tiledb:dev
#
# Use the build arg 'enable' to configure optional TileDB components, e.g.:
#   docker build --build-arg enable=s3,hdfs -t tiledb:dev

FROM tiledb/tiledb:base

# Optional components to enable (defaults to empty).
ARG enable

# Install TileDB
RUN git clone https://github.com/TileDB-Inc/TileDB.git /home/tiledb/TileDB \
    && cd /home/tiledb/TileDB \
    && mkdir build \
    && cd build \
    && ../bootstrap --enable-debug --enable-verbose --enable-azure --enable-s3 --enable-serialization --enable=${enable} \
    && make -j2 \
    && make -j2 examples \
    && make install-tiledb \
    && echo 'export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/home/tiledb/TileDB/dist/lib' >> /home/tiledb/.bashrc

# Install Python bindings
RUN git clone https://github.com/TileDB-Inc/TileDB-Py.git /home/tiledb/TileDB-Py \
    && cd /home/tiledb/TileDB-Py \
    && pip3 install -r requirements_dev.txt \
    && python3 setup.py develop --tiledb=/home/tiledb/TileDB/dist

RUN chown -R tiledb: /home/tiledb

ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
EXPOSE 22

USER tiledb
WORKDIR /home/tiledb
ENTRYPOINT /bin/bash
