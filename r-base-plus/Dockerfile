
# Extend the tiledb R base image by adding the TileDB library build

# To build:
#   docker build -t tiledb/tiledb:r-base-plus .

#FROM tiledb/tiledb:r-base
FROM eddelbuettel/tiledb_r-base

RUN apt-get update \
    && apt-get -y dist-upgrade \
    && buildTileDB.sh \
    && rm -rf /tmp/TileDB 

CMD ["bash"]
