# Ubuntu Trusty Docker file for base TileDB Dependencies

# To build run:
# docker build -t tiledb:base

# Ubuntu Trusty
FROM ubuntu:18.04

# Setup home environment
RUN useradd tiledb
RUN mkdir /home/tiledb && chown tiledb /home/tiledb
ENV HOME /home/tiledb

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    unzip \
    git \
    cmake \
    python3 \
    python3-dev \
    python3-pip \
    libssl-dev \
    && apt-get clean \
    && apt-get purge -y \
    && rm -rf /var/lib/apt/lists*

