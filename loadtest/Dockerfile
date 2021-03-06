FROM phusion/baseimage:0.11
MAINTAINER Sergiu Ivasenco <contact@softinite.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm
ENV LUA_VERSION "5.3"
ENV LUA_ROCKS_VERSION "3.2.1"

RUN apt-get update && \
    apt-get -y -f upgrade && \
    apt-get install -f -y libz-dev nano iputils-ping build-essential net-tools telnet apache2-utils libssl-dev git curl wget unzip libreadline-dev

RUN cd /home && \
    git clone https://github.com/giltene/wrk2.git wrk && \
    cd wrk && \
    make && \
    cp wrk /usr/local/bin && \
    mkdir /test

ADD benchmarkTest.sh /test/benchmarkTest.sh

RUN echo "lua version=$LUA_VERSION"

WORKDIR /home

RUN apt-get install -y -f lua$LUA_VERSION liblua$LUA_VERSION-dev

RUN echo "lua rocks version=$LUA_ROCKS_VERSION"

# Install Luarocks - a lua package manager
RUN curl "https://codeload.github.com/luarocks/luarocks/tar.gz/v$LUA_ROCKS_VERSION" --output luarocks.tar.gz && \
    tar -xzvf "luarocks.tar.gz" && \
    cd "luarocks-$LUA_ROCKS_VERSION" && \
    ./configure && \
    make build && \
    make install

# Install the cjson package
RUN luarocks install lua-cjson

# Raise the limits to successfully run benchmarks
RUN ulimit -c -m -s -t unlimited

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
