FROM node:8-alpine
MAINTAINER Pablo Barrales <pablo.barrales@peanuthub.cl>

# ENV VAR
ARG PHANTOM_JS=phantomjs-2.1.1-linux-x86_64

# PACKAGES
RUN apk update && \
    apk add --no-cache --virtual .build-deps \
        wget \
        ca-certificates && \
    cd ~ && \
    export PHANTOM_JS="${PHANTOM_JS}" && \
    wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
    mv $PHANTOM_JS.tar.bz2 /usr/local/share/ && \
    cd /usr/local/share/ && \
    tar xvjf $PHANTOM_JS.tar.bz2 && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs && \
    ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs && \
    rm -f /usr/local/share/$PHANTOM_JS.tar.bz2 && \
    yarn global add bower gulp node-sass karma-cli && \
    yarn cache clean && \ 
    apk del .build-deps