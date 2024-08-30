MAINTAINER "Sergiu Ivasenco"
FROM ubuntu:24.10

ENV EDITOR=nano

RUN apt update -y && apt upgrade -y && apt autoremove -y && apt autoclean -y

RUN apt install -y wget nano iputils-ping git

RUN git clone https://github.com/danielmiessler/fabric.git && \
    cd fabric && \
    apt install -y pipx && \
    pipx install . && \
    pipx ensurepath


