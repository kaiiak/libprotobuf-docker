FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -y git \
                        g++ \
                        make \
                        wget \
                        autoconf \
                        libtool \
                        automake

# https://github.com/protocolbuffers/protobuf/releases/tag/v3.6.1.3
# https://github.com/protocolbuffers/protobuf/tree/v3.6.1.3/src

RUN cd /home && wget -O protobuf-3.6.1.3.tar.gz https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.6.1.3.tar.gz \
  && tar xfz protobuf-3.6.1.3.tar.gz \
  && rm protobuf-3.6.1.3.tar.gz \
  && cd protobuf-3.6.1.3 \
  && ./autogen.sh \
  && ./configure --prefix=/usr/ \
  && make \
  && make install \
  && cd /home \
  && rm -rf protobuf-3.6.1.3

CMD ["bash"]