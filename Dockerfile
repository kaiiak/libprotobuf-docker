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

RUN cd /home && wget https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.6.1.3.tar.gz \
  && tar xfz v3.6.1.3.tar.gz \
  && rm v3.6.1.3.tar.gz \
  && cd v3.6.1.3 \
  && ./autogen.sh \
  && ./configure --prefix=/usr/ \
  && make \
  && make intall \
  && cd /home \
  && rm -rf v3.6.1.3

CMD ["bash"]