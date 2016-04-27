FROM ubuntu

RUN apt-get update
RUN apt-get install -y build-essential curl bash nano zlib1g-dev libpcre3-dev libssl-dev clang
RUN curl -Os https://storage.googleapis.com/golang/go1.6.2.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.6.2.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

RUN mkdir /lab
WORKDIR /lab

ADD bootstrap.sh /lab
ARG NGINX_VERSION
RUN NGINX_VERSION=$NGINX_VERSION /lab/bootstrap.sh

COPY . /lab
RUN NGINX_VERSION=$NGINX_VERSION /lab/compile.sh