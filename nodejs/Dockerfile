FROM phusion/baseimage:0.9.19
MAINTAINER "Sergiu Ivasenco"

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN groupadd --gid 1000 softinite \
  && useradd --uid 1000 --gid softinite --shell /bin/bash --create-home softinite

# gpg keys listed at https://github.com/nodejs/node
RUN set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 6.9.1
ENV TERM xterm

RUN apt-get update && \
	apt-get install -f -y curl wget apt-utils xz-utils nano git openssh-client build-essential libudev-dev && \
	git config --global credential.helper store && \
	apt-get install -f

RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
  && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-x64.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 \
  && rm "node-v$NODE_VERSION-linux-x64.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
&& ln -s /usr/local/bin/node /usr/local/bin/nodejs

RUN npm install gulp -g && \
	npm install node-gyp -g  && \
	npm install node-inspector -g  && \
	npm install nodemon -g  && \
	apt-get install -y python  && \
	apt-get install -y -qq ruby-dev  && \
	gem install --no-rdoc --no-ri compass  && \
	apt-get install -y fontforge  && \
	npm install -g ttf2eot

RUN echo "Please perform a git operation requiring credentials after starting the container in order to store them for npm use."

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
