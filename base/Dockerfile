# Ubuntu Trusty Docker file for TileDB Dependencies

# To build run:
# docker build -t tiledb:base

# Ubuntu Trusty
FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libbz2-dev \
    libc6 \
    libc6-dev \
    liblz4-dev \
    libsnappy-dev \
    vim \
    wget \
    zlib1g-dev \
    && apt-get clean \
    && apt-get purge -y \
    && rm -rf /bar/lib/apt/lists*

# Install an updated version of CMake
RUN wget -P /tmp https://cmake.org/files/v3.9/cmake-3.9.4-Linux-x86_64.tar.gz \
    && tar xzf /tmp/cmake-3.9.4-Linux-x86_64.tar.gz -C /tmp \
    && rm /tmp/cmake-3.9.4-Linux-x86_64.tar.gz \
    && cp /tmp/cmake-3.9.4-Linux-x86_64/bin/* /usr/local/bin \
    && cp -r /tmp/cmake-3.9.4-Linux-x86_64/share/cmake-3.9 /usr/local/share \
    && rm -rf /tmp/cmake-3.9.4-Linux-x86_64

# Install Zstandard
RUN wget -P /tmp https://github.com/facebook/zstd/archive/v1.3.2.tar.gz \
    && tar xzf /tmp/v1.3.2.tar.gz -C /tmp \
    && rm /tmp/v1.3.2.tar.gz \
    && cd /tmp/zstd-1.3.2/lib \
    && make install \
    && rm -rf /tmp/zstd-1.3.2

# Install Blosc
RUN wget -P /tmp https://github.com/Blosc/c-blosc/archive/v1.12.1.tar.gz \
    && tar xzf /tmp/v1.12.1.tar.gz -C /tmp \
    && rm /tmp/v1.12.1.tar.gz \
    && cd /tmp/c-blosc-1.12.1 \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_BUILD_TYPE=Release \
    && cmake --build . --target install \
    && rm -rf /tmp/c-blosc-1.12.1
