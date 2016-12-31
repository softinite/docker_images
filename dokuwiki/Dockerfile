FROM phusion/baseimage:0.9.19

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm

# Update & install packages & cleanup afterwards
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get -y upgrade && \
    apt-get -y -f install wget lighttpd php7.0-cgi php7.0-gd php7.0-ldap nano iputils-ping build-essential php-mbstring php7.0-xml && \
    apt-get clean autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

# Download & check & deploy dokuwiki & cleanup
RUN wget -q -O /dokuwiki.tgz "https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz" && \
    mkdir /dokuwiki && \
    tar -zxf dokuwiki.tgz -C /dokuwiki --strip-components 1 && \
    rm dokuwiki.tgz

# Set up ownership
ADD info.php /dokuwiki/info.php

RUN chown -R www-data:www-data /dokuwiki

# Configure lighttpd
ADD dokuwiki.conf /etc/lighttpd/conf-available/20-dokuwiki.conf
RUN lighty-enable-mod dokuwiki fastcgi accesslog
RUN mkdir /var/run/lighttpd && chown www-data:www-data /var/run/lighttpd
EXPOSE 80

RUN mkdir /etc/service/doku
ADD doku.sh /etc/service/doku/run
RUN chmod +x /etc/service/doku/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
