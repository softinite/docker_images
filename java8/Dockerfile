FROM phusion/baseimage:0.10.1
MAINTAINER "Sergiu Ivasenco"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

ENV TERM xterm

RUN apt-get update && \
	apt-get install -f -y curl wget apt-utils xz-utils nano git openssh-client iputils-ping telnet net-tools mlocate && \
	apt-get install -f -y && \
	apt-get upgrade -f -y

# Install Java.
RUN \
  wget https://download.java.net/java/GA/jdk12.0.1/69cfe15208a647278a19ef0990eea691/12/GPL/openjdk-12.0.1_linux-x64_bin.tar.gz --no-check-certificate && \
  tar xfvz openjdk-12.0.1_linux-x64_bin.tar.gz && \
  mv -fv jdk-12.0.1 /usr/lib/jvm/


# Define working directory.
WORKDIR /usr/local

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/jdk-12.0.1
ENV PATH "${JAVA_HOME}/bin:${PATH}"


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
