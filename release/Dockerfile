# Build and install the latest TileDB stable release

# To build:
#   docker build -t tiledb:release
#
# Use the build arg 'enable' to configure optional TileDB components, e.g.:
#   docker build --build-arg enable=s3,hdfs -t tiledb:release

FROM tiledb/tiledb:base

# Optional components to enable (defaults to empty).
ARG enable
# Release version number of TileDB to install.
ARG version=2.0.0
# Release version number of TileDB-Py to install.
# -- see below --

# Install TileDB
RUN wget -P /home/tiledb https://github.com/TileDB-Inc/TileDB/archive/${version}.tar.gz \
    && tar xzf /home/tiledb/${version}.tar.gz -C /home/tiledb \
    && rm /home/tiledb/${version}.tar.gz \
    && cd /home/tiledb/TileDB-${version} \
    && mkdir build \
    && cd build \
    && ../bootstrap --prefix=/usr/local --enable-azure --enable-s3 --enable-serialization --enable=${enable} \
    && make -j$(nproc) \
    && make -j$(nproc) examples \
    && make install-tiledb \
    && rm -rf /home/tiledb/TileDB-${version}

# Release version number of TileDB-Py to install.
ARG pyversion=0.6.0
ENV pyversion=$pyversion SETUPTOOLS_SCM_PRETEND_VERSION=$pyversion

# -----------------------------------------------------------------------------

# Install Python bindings
RUN wget https://github.com/TileDB-Inc/TileDB-Py/archive/${pyversion}.tar.gz -O /home/tiledb/Py-${pyversion}.tar.gz \
    && tar xzf /home/tiledb/Py-${pyversion}.tar.gz -C /home/tiledb \
    && rm /home/tiledb/Py-${pyversion}.tar.gz \
    && cd /home/tiledb/TileDB-Py-${pyversion} \
    && pip3 install -r requirements.txt \
    && python3 setup.py install --tiledb=/usr/local \
    && rm -rf /home/tiledb/TileDB-Py-${pyversion}

EXPOSE 22

# this can be removed for TileDB-Py 0.4.3
ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

WORKDIR /home/tiledb
ENTRYPOINT /bin/bash
