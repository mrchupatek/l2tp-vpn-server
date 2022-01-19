FROM debian

RUN apt-get -yqq update \
    && apt-get -yqq --no-install-recommends install \
         wget dnsutils openssl ca-certificates kmod \
         gawk grep sed net-tools iptables \
         libnss3-dev libnspr4-dev pkg-config libpam0g-dev \
         libcap-ng-dev libcap-ng-utils libselinux1-dev \
         libcurl4-nss-dev flex bison gcc make \
         libunbound-dev libnss3-tools libevent-dev xl2tpd xmlto \
         jq \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/src

RUN wget https://raw.githubusercontent.com/mrchupatek/setup-ipsec-vpn/master/vpnsetup_ubuntu.sh -O /opt/src/vpnsetup.sh

RUN chmod 755 /opt/src/vpnsetup.sh

EXPOSE 500/udp 4500/udp

VOLUME ["/lib/modules"]
