# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.21

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
    apt-get -y -f upgrade && \
    apt-get install -f -y nano iputils-ping build-essential net-tools telnet apache2-utils libssl-dev git

RUN cd /home && \
    git clone https://github.com/wg/wrk.git && \
    cd wrk && \
    make && \
    cp wrk /usr/local/bin

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*