FROM phusion/baseimage:focal-1.0.0

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm

# Update & install packages & cleanup afterwards
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y update && \
    apt-get -y -f install wget nano iputils-ping build-essential net-tools telnet curl unzip && \
    apt-get clean autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

RUN curl -fsSL https://get.deta.dev/cli.sh | sh

ENV PATH "/root/.deta/bin:$PATH"

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

