FROM debian as build
WORKDIR /opt/src
RUN apt-get -yqq update \
    && apt-get -yqq --no-install-recommends install \
         wget dnsutils openssl ca-certificates kmod \
         gawk grep sed net-tools iptables \
         flex bison gcc make \
         xl2tpd xmlto \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
COPY ./add_users.sh /opt/src/add_users.sh
COPY ./del_users.sh /opt/src/del_users.sh
RUN wget https://raw.githubusercontent.com/mrchupatek/l2tp-vpn-server/main/vpnsetup_ubuntu.sh -O /opt/src/vpnsetup.sh
RUN chmod 755 /opt/src/vpnsetup.sh

FROM debian:stable-slim
COPY --from=build /opt/src /opt/src
EXPOSE 500/udp 4500/udp
VOLUME ["/lib/modules"]
