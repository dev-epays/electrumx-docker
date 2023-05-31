FROM python:3.9.16-slim-buster

ENV ELECTRUMX_VERSION=1.16.0
RUN useradd -m electrumx && apt-get update -y && apt-get install curl \
    librocksdb-dev \
    liblz4-dev \
    build-essential \
    libsnappy-dev \
    zlib1g-dev \
    libbz2-dev \
    libgflags-dev \
    libleveldb-dev -y && mkdir /usr/local/electrumx/

RUN git clone https://github.com/spesmilo/electrumx.git /usr/local/electrumx/
WORKDIR /usr/local/electrumx/
RUN git reset --hard c689a831cb4f3a8fc964424d7a77fe47df7d0377
USER electrumx
RUN pip3 install -r /usr/local/electrumx/requirements.txt
EXPOSE 50002
CMD python3.9 /usr/local/electrumx/electrumx_server
