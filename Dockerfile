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
COPY files/vpncloud.yml /etc/vpncloud/vpncloud.yml
COPY entrypoint.sh /entrypoint.sh

RUN dpkg -i vpncloud_${VPNCLOUD_VERSION}_amd64.deb

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]