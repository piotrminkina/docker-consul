FROM consul-build
MAINTAINER Piotr Minkina <projekty@piotrminkina.pl>


WORKDIR $GOPATH/src/$CONSUL_PKG

RUN make test

WORKDIR /
