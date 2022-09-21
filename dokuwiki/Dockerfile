FROM phusion/baseimage:jammy-1.0.1

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm

# Update & install packages & cleanup afterwards
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y -f install wget lighttpd php php-cli php-cgi php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath nano iputils-ping build-essential net-tools telnet && \
    apt-get clean autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

# Download & check & deploy dokuwiki & cleanup
RUN echo "Building 2.0.4" && wget -q -O /dokuwiki.tgz "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz" && \
    mkdir /dokuwiki && \
    tar -zxf dokuwiki.tgz -C /dokuwiki --strip-components 1 && \
    rm dokuwiki.tgz

# Set up ownership
ADD info.php /dokuwiki/info.php
ADD local.php /dokuwiki/conf/local.protected.php
ADD users.php /dokuwiki/conf/users.auth.php
ADD mime.conf /dokuwiki/conf/mime.local.conf
RUN mkdir -p /dokuwiki/data && \
    mkdir -p /dokuwiki/data/pages && \
    mkdir -p /dokuwiki/data/attic

RUN chown -R www-data:www-data /dokuwiki

# Configure lighttpd
ADD dokuwiki.conf /etc/lighttpd/conf-available/20-dokuwiki.conf
RUN lighty-enable-mod dokuwiki fastcgi accesslog
RUN mkdir /var/run/lighttpd && chown www-data:www-data /var/run/lighttpd
EXPOSE 80

RUN mkdir /etc/service/doku
ADD doku.sh /etc/service/doku/run
RUN chmod +x /etc/service/doku/run && touch /var/run/lighttpd.pid && chown www-data:www-data /var/run/lighttpd.pid && chmod 744 /var/run/lighttpd.pid
#the following line will allow the service to bind on port 80
RUN setcap CAP_NET_BIND_SERVICE=+eip /usr/sbin/lighttpd

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
