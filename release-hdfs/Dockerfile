# Build and install the latest TileDB stable release

# To build:
#   docker build -t tiledb:release
#
# Use the build arg 'enable' to configure optional TileDB components, e.g.:
#   docker build --build-arg enable=s3,hdfs -t tiledb:release

FROM tiledb:base

# Optional components to enable (defaults to empty).
ARG enable
# Release version number of TileDB to install.
ARG version=1.7.4
# Release version number of TileDB-Py to install.
# -- see below --

ADD install-hadoop.sh /tmp/install-hadoop.sh
RUN /tmp/install-hadoop.sh
# Install HDFS libs
#RUN apt-get update && apt-get install -y \
#    software-properties-common \
#    openjdk-8-jre \
#    && apt-get clean \
#    && apt-get purge -y \
#    && rm -rf /bar/lib/apt/lists* \
#    && update-alternatives --install /usr/local/bin/python3 python3 /usr/bin/python3.5 1
#
#RUN mkdir -p /usr/local/hadoop/ \
#    && chown -R $(whoami) /usr/local/hadoop \
#    && pushd /usr/local/hadoop \
#  # download from closest mirror
#    && curl -G -L -d "action=download" -d "filename=hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz" \
#	  https://www.apache.org/dyn/mirrors/mirrors.cgi -o hadoop-${HADOOP_VERSION}.tar.gz \
#    && tar xzf hadoop-${HADOOP_VERSION}.tar.gz \
#    && rm -rf ./home/hadoop-${HADOOP_VERSION} \
#    && mv hadoop-${HADOOP_VERSION} home \
#    && chown -R $(whoami) /usr/local/hadoop \
#    && popd

# Install TileDB
RUN wget -P /home/tiledb https://github.com/TileDB-Inc/TileDB/archive/${version}.tar.gz \
    && tar xzf /home/tiledb/${version}.tar.gz -C /home/tiledb \
    && rm /home/tiledb/${version}.tar.gz \
    && cd /home/tiledb/TileDB-${version} \
    && mkdir build \
    && cd build \
    && ../bootstrap --prefix=/usr/local --enable-s3 --enable-serialization --enable-hdfs --enable=${enable} \
    && make -j$(nproc) \
    && make -j$(nproc) examples \
    && make install-tiledb \
    && rm -rf /home/tiledb/TileDB-${version}

# Release version number of TileDB-Py to install.
ARG pyversion=0.5.5
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

ENV LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"

WORKDIR /home/tiledb
ENTRYPOINT /bin/bash
