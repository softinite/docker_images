#!/bin/sh
exec /sbin/setuser www-data /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf >>/var/log/lighttpd/info.log 2>&1
