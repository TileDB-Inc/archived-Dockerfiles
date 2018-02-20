# Ubuntu Trusty Docker file for base TileDB Dependencies

# To build run:
# docker build -t tiledb:base

# Ubuntu Trusty
FROM ubuntu:trusty

# Setup home environment
RUN useradd tiledb
RUN mkdir /home/tiledb
ENV HOME /home/tiledb

RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    git \
    python3 \
    python3-dev \
    && apt-get clean \
    && apt-get purge -y \
    && rm -rf /bar/lib/apt/lists*
