FROM alpine:3.1
MAINTAINER Piotr Minkina <projekty@piotrminkina.pl>


ADD consul.tar /
RUN ln -s /opt/consul/bin/consul /usr/local/bin/consul


VOLUME ["/opt/consul/var/lib/consul"]

EXPOSE \
    # The DNS server
    8600 \
    8600/udp \

    # The HTTP API
    8500 \

    # The RPC endpoint
    8400 \

    # The Serf LAN port
    8301 \
    8301/udp \

    # The Serf WAN port
    8302 \
    8302/udp \

    # Server RPC address
    8300

ENTRYPOINT [ \
    "/usr/local/bin/consul", \
    "agent", \
    "-config-file=/opt/consul/etc/consul.json", \
    "-config-dir=/opt/consul/etc/consul.d" \
]

CMD []
