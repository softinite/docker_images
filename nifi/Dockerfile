FROM phusion/baseimage:0.9.21

MAINTAINER Sergiu Ivasenco

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm

RUN apt-get update && \
	apt-get install -f -y curl wget apt-utils xz-utils nano git openssh-client iputils-ping telnet net-tools mlocate && \
	apt-get install -f -y && \
	apt-get upgrade -f -y

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# Define working directory.
WORKDIR /usr/local

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

ENV NIFI_VERSION 1.1.2

RUN curl -SLO "http://apache.parentingamerica.com/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz" \
  #TODO: fix this && curl -O "https://www.apache.org/dist/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz.sha256" \
  #&& cat "nifi-$NIFI_VERSION-bin.tar.gz.sha256" | sha256sum -c - \
  && tar -xf "nifi-$NIFI_VERSION-bin.tar.gz" -C /usr/local --strip-components=1

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

