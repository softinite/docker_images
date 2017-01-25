FROM phusion/baseimage:0.9.19
MAINTAINER "Sergiu Ivasenco"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get update && \
	apt-get install -f -y curl wget apt-utils xz-utils nano openssh-client build-essential libudev-dev && \
	apt-get install -f

RUN mkdir /usr/local/zap \
    && curl -SLO "https://github.com/zaproxy/zaproxy/releases/download/2.5.0/ZAP_2.5.0_Linux.tar.gz" \
    && tar -xzvf "ZAP_2.5.0_Linux.tar.gz" -C /usr/local/zap --strip-components=1

ADD start.sh /usr/local/zap/start.sh


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
