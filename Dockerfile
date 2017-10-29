# This will build the witness_node in a docker image. Make sure you've already
# checked out the submodules before building.

FROM ubuntu:xenial-20171006
MAINTAINER Bill Butler <bill@butler.net>

RUN apt update
RUN apt install -y apt-utils autoconf cmake git libboost-all-dev libssl-dev g++

ADD . /bitshares-core
WORKDIR /bitshares-core
RUN cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .
RUN make

# RUN mkdir /data_dir
# ADD docker/default_config.ini /default_config.ini
# ADD docker/launch /launch
# RUN chmod a+x /launch
# VOLUME /data_dir

# EXPOSE 8090 9090

# ENTRYPOINT ["/launch"]

# Build inside Docker image