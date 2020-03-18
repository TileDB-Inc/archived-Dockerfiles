# Dockerfile for TileDB and R

# Rocker r-base is Debian testing, hence "current" and reasonably complete
FROM r-base

LABEL org.label-schema.license="MIT" \
      org.label-schema.vcs-url="https://github.com/rocker-tiledb/" \
      org.label-schema.vendor="TileDB, Inc." \
      maintainer="TileDB, Inc. <hello@tiledb.com>"

RUN apt-get update && apt-get install -y -t unstable --no-install-recommends \
    cmake \
    git \
    liblz4-dev \
    libssl-dev \
    libzstd-dev \
    libcurl4-openssl-dev \
    r-cran-data.table \
    r-cran-rcpp \
    r-cran-testthat \
    && apt-get clean \
    install.r tinytest
    
ENV _R_CHECK_FORCE_SUGGESTS_ false

RUN cd /home/docker \
    && git clone --single-branch --branch release-1.7.6 https://github.com/TileDB-Inc/TileDB.git tiledb \
    && cd tiledb \
    && mkdir build \
    && cd build \
    && ../bootstrap --prefix=/usr/local --enable-serialization --enable-s3 --enable-verbose \
    && make -j $(nproc) \
    && make -C tiledb install \
    && ldconfig \
    && cd /home/docker \
    && rm -rf tiledb

RUN install.r remotes && installGithub.r TileDB-Inc/TileDB-R

CMD ["R"]
