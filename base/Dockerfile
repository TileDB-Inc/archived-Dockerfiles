# Ubuntu Trusty Docker file for TileDB Dependencies

# To build run:
# docker build -t tiledb:base

# Ubuntu Trusty
FROM ubuntu:14.04.5

RUN apt-get update && \
    apt-get install -y \
    libc6 \
    libc6-dev \
    build-essential \
    vim \
    wget \
    cmake \
    git \
    mpich \
    libmpich2-dev \
    zlib1g-dev \
    libssl-dev \
    libgtest-dev \
    liblz4-dev \
    && apt-get clean \
    && apt-get purge -y

# Install Zstandard
RUN wget -P /tmp https://github.com/facebook/zstd/archive/v1.0.0.tar.gz && \
    tar xf /tmp/v1.0.0.tar.gz -C /tmp && \
    rm /tmp/v1.0.0.tar.gz && \
    cd /tmp/zstd-1.0.0 && \
    sudo make install PREFIX='/usr' && \
    rm -rf /tmp/zstd-1.0.0

# Install Blosc
RUN git clone --depth 1 https://github.com/Blosc/c-blosc /tmp/c-blosc && \
    cd /tmp/c-blosc && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX='/usr' .. && \
    cmake --build . && \
    cmake --build . --target install && \
    rm -rf /tmp/c-blosc

# Install Google Test
RUN wget -P /tmp https://github.com/google/googletest/archive/release-1.8.0.tar.gz && \
    tar xf /tmp/release-1.8.0.tar.gz -C /tmp && \
    rm /tmp/release-1.8.0.tar.gz && \
    cd /tmp/googletest-release-1.8.0/googletest && \
    cmake -DBUILD_SHARED_LIBS=ON . && \
    make && \
    cp -a include/gtest /usr/include && \
    cp -a libgtest_main.so libgtest.so /usr/lib/ && \
    rm -rf /tmp/googletest-release-1.8.0
