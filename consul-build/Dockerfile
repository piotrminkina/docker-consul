FROM alpine:3.1
MAINTAINER Piotr Minkina <projekty@piotrminkina.pl>


ENV CONSUL_UC=https://dl.bintray.com/mitchellh/consul \
    CONSUL_PKG=github.com/hashicorp/consul \
    CONSUL_VERSION=0.5.0 \
    GOPATH=/opt/build

RUN apk --update add bash curl gcc git go libgcc make musl-dev zip

WORKDIR /opt/consul

RUN mkdir -p \
        bin \
        etc/consul.d \
        usr/share \
        var/lib/consul

COPY consul.json etc/consul.json

WORKDIR $GOPATH/src/$CONSUL_PKG

RUN git clone -b "v${CONSUL_VERSION}" https://${CONSUL_PKG}.git . \
 && go get -u ./... \
 && make \
 && cp bin/consul /opt/consul/bin/

WORKDIR /opt/consul/usr/share

RUN curl -sSLo consul-webui.zip ${CONSUL_UC}/${CONSUL_VERSION}_web_ui.zip \
 && unzip consul-webui.zip -x dist/ \
 && mv dist consul-webui \
 && rm -f consul-webui.zip

WORKDIR /
