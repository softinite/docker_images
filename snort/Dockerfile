FROM phusion/baseimage:jammy-1.0.1
MAINTAINER "Sergiu Ivasenco"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update && \
	apt-get install -f -y curl wget apt-utils xz-utils nano openssh-client build-essential libudev-dev iputils-ping libssl-dev && \
	apt-get install -f

#ENV CMAKE_VERSION="3.25.2"
#
#RUN wget https://github.com/Kitware/CMake/releases/download/v$CMAKE_VERSION/cmake-$CMAKE_VERSION.tar.gz && \
#    tar xzf cmake-$CMAKE_VERSION.tar.gz && \
#    cd cmake-$CMAKE_VERSION && \
#    ./configure --prefix=/opt/cmake && \
#    make && make install && \
#    /opt/cmake/bin/cmake -version
#RUN apt-get install -y -f libdnet

#source -> https://linuxopsys.com/topics/install-snort-on-ubuntu
RUN apt-get install -y -f build-essential git libpcap-dev libpcre3-dev libnet1-dev zlib1g-dev luajit hwloc libdnet-dev \
                          libdumbnet-dev bison flex liblzma-dev openssl libssl-dev pkg-config libhwloc-dev cmake \
                          cpputest libsqlite3-dev uuid-dev libcmocka-dev libnetfilter-queue-dev libmnl-dev autotools-dev \
                          libluajit-5.1-dev libunwind-dev net-tools

RUN mkdir snort-deps && cd snort-deps

RUN git clone https://github.com/snort3/libdaq.git && cd libdaq && ./bootstrap && ./configure && make && make install && cd ..

RUN wget https://github.com/gperftools/gperftools/releases/download/gperftools-2.10/gperftools-2.10.tar.gz && \
    tar xzf gperftools-2.10.tar.gz && cd gperftools-2.10 && ./configure && make && make install && cd ..

RUN git clone https://github.com/snortadmin/snort3.git && cd snort3 && ./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc && \
    cd build && make && make install && ldconfig && cd ..

RUN ln -s /usr/local/bin/snort /usr/sbin/snort

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
