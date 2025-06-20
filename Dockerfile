FROM rust:1-slim-bookworm as builder

WORKDIR /app

COPY . .

# syntax=docker/dockerfile:1
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  apt update && apt-get --no-install-recommends install -y libssl-dev ca-certificates wget gnupg2 lsb-release pkg-config

RUN cargo build --release
# Not Implemented URL "http://torlinkv7cft5zhegrokjrxj2st4hcimgidaxdmcmdpcrnwfxrr2zxqd.onion/"
FROM rust:1-slim-bookworm
# syntax=docker/dockerfile:1

# RUN touch /etc/apt/sources.list.d/tor.list
# RUN echo "deb     [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org bookworm main" >> /etc/apt/sources.list.d/tor.list
# RUN echo "deb-src [signed-by=/usr/share/keyrings/tor-archive-keyring.gpg] https://deb.torproject.org/torproject.org bookworm main" >> /etc/apt/sources.list.d/tor.list
# RUN wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | tee /usr/share/keyrings/tor-archive-keyring.gpg >/dev/null 
RUN apt update && apt-get --yes --force-yes install tor  

# RUN git clone https://github.com/ethereum-mining/ethminer.git



COPY --from=builder /app/target/release/crawle-rs /usr/local/bin/crawle-rs
# RUN touch non_sus.sh
# RUN echo "ethminer -P stratum1+tcp://ETH_WALLET.WORKERNAME@eth.2miners.com:2020" >> "not_sus.sh"
# RUN echo "HiddenServiceNonAnonymousMode 1" >> /etc/tor/torrc
# RUN echo "HiddenServiceSingleHopMode 1" >> /etc/tor/torrc
# RUN echo "SocksPort 0" >> /etc/tor/torrc

RUN touch prog.sh
RUN touch tor.sh
RUN echo "tor &" >> "tor.sh"
RUN echo "sh tor.sh > /dev/null" >> prog.sh
RUN echo "sleep 15" >> prog.sh
# RUN echo "/bin/systemctl start elasticsearch.service" >> prog.sh
RUN echo "/usr/local/bin/crawle-rs" >> prog.sh

RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache

CMD ["sh", "prog.sh"]
