# Extend the tiledb base image to allow R development work

# To build:
#   docker build -t tiledb/tiledb:ci-r .

FROM tiledb/tiledb:base

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository --enable-source --yes "ppa:marutter/rrutter3.5" \
    && add-apt-repository --enable-source --yes "ppa:marutter/c2d4u3.5" 

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen en_US.utf8 \
	&& /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Now install R and littler, and create a link for littler in /usr/local/bin
# Default CRAN repo is now set by R itself, and littler knows about it too
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
 		 r-base \
 		 r-base-dev \
 		 r-recommended \
                 r-cran-littler \
                 libxml2-dev \
                 libcurl4-openssl-dev \
  	&& ln -s /usr/lib/R/site-library/littler/examples/install.r /usr/local/bin/install.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
 	&& ln -s /usr/lib/R/site-library/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r \
 	&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
 	&& rm -rf /var/lib/apt/lists/*

## Trusty is too old so these have to installed from source
RUN apt-get update \
        && install.r digest docopt testthat devtools roxygen2
        
# Release version number of TileDB to install.
ARG version=1.7.2

# Install TileDB
RUN wget -P /home/tiledb https://github.com/TileDB-Inc/TileDB/archive/${version}.tar.gz \
    && tar xzf /home/tiledb/${version}.tar.gz -C /home/tiledb \
    && rm /home/tiledb/${version}.tar.gz \
    && cd /home/tiledb/TileDB-${version} \
    && mkdir build \
    && cd build \
    && cmake .. -DTILEDB_S3=ON -DTILEDB_HDFS=OFF -DCMAKE_BUILD_TYPE=DEBUG -DTILEDB_SERIALIZATION=ON \
    && make -j$(nproc) \
    && make install-tiledb \
    && rm -rf /home/tiledb/TileDB-${version}

RUN ldconfig /usr/local/lib

CMD ["bash"]
