FROM ubuntu:20.04

ENV VPNCLOUD_VERSION "2.2.0"

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
    gnupg2 \
    wget \
    git \
    net-tools

WORKDIR /opt

COPY files/vpncloud_${VPNCLOUD_VERSION}_amd64.deb /opt/vpncloud_${VPNCLOUD_VERSION}_amd64.deb

RUN dpkg -i vpncloud_${VPNCLOUD_VERSION}_amd64.deb

EXPOSE 3210/udp

CMD ["vpncloud", "--password", "badpassword123", "--ip", "10.0.0.100"]