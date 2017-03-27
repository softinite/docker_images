FROM phusion/baseimage:0.9.19
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


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*