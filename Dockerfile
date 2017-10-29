# This will build the witness_node in a docker image. Make sure you've already
# checked out the submodules before building.

FROM ubuntu:xenial-20171006
MAINTAINER Bill Butler <bill@butler.net>

ADD . /bitshares-core
WORKDIR /bitshares-core

RUN apt update && apt install -y \
apt-utils \
autoconf \
cmake \
git \
libboost-all-dev \
libssl-dev g++

RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .
RUN make

RUN mkdir /data_dir
ADD docker/default_config.ini /default_config.ini
VOLUME /data_dir

EXPOSE 8090 9090