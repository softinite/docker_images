FROM phusion/baseimage:0.9.21
MAINTAINER Sergiu Ivasenco <contact@softinite.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm
#at the time of the writting, wrk had dependency on lua 5.1
ENV LUA_VERSION "5.1"
ENV LUA_ROCKS_VERSION "2.4.2"

RUN apt-get update && \
    apt-get -y -f upgrade && \
    apt-get install -f -y nano iputils-ping build-essential net-tools telnet apache2-utils libssl-dev git curl wget unzip libreadline-dev

RUN cd /home && \
    git clone https://github.com/wg/wrk.git && \
    cd wrk && \
    make && \
    cp wrk /usr/local/bin


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