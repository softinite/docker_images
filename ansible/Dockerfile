FROM phusion/baseimage:bionic-1.0.0

CMD ["/sbin/my_init"]

ENV EDITOR=nano

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    acl curl make sudo unzip zip nano iputils-ping build-essential net-tools telnet


RUN apt update -y && \
    apt install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt install -y ansible

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
