FROM ubuntu:24.10

ENV EDITOR=nano

RUN echo "Updating the environment" && apt update -y && apt upgrade -y && apt autoremove -y && apt autoclean -y

RUN echo "Installing utilities" && apt install -y wget nano iputils-ping git pipx

RUN echo "Installing Go" &&  rm -rf /usr/local/go &&  \
    wget https://go.dev/dl/go1.23.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.23.3.linux-amd64.tar.gz && \
    export PATH=$PATH:/usr/local/go/bin && \
     go version

RUN echo "Installing Fabric" &&  \
    /usr/local/go/bin/go install github.com/danielmiessler/fabric@latest

COPY setup.sh /opt/setup.sh

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


