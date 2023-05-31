FROM debian:stable-slim

ENV ELECTRUMX_VERSION=1.16.0
RUN apt-get update -y && apt-get install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN useradd -m electrumx && apt-get update -y && apt-get install curl \
    python3.9 \
    python3.9-dev \
    python3.9-distutils \
    python3-pip \
    librocksdb-dev \
    liblz4-dev \
    build-essential \
    libsnappy-dev \
    zlib1g-dev \
    libbz2-dev \
    libgflags-dev \
    libleveldb-dev -y && mkdir /usr/local/electrumx/
ENV ELECTRUMX_URL=https://github.com/spesmilo/electrumx/archive/refs/tags/${ELECTRUMX_VERSION}.tar.gz

RUN curl -SLO ${ELECTRUMX_URL} \
  && tar --strip=1 -xzf *.tar.gz -C /usr/local/electrumx/ \
  && rm *.tar.gz

USER electrumx
COPY ./requirements.txt /usr/local/electrumx/requirements.txt
RUN pip3 install -r /usr/local/electrumx/requirements.txt
EXPOSE 50002
CMD python3.10 /usr/local/electrumx/electrumx_server
