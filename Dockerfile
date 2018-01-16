FROM node:8-alpine
MAINTAINER Pablo Barrales <pablo.barrales@peanuthub.cl>

# PACKAGES
RUN apk update && \
    apk add --no-cache --virtual .build-deps \
        curl \
        ca-certificates && \
    curl -Ls https://github.com/fgrehm/docker-phantomjs2/releases/download/v2.0.0-20150722/dockerized-phantomjs.tar.gz \
        | tar xz -C / && \
    yarn global add bower gulp jsdoc node-sass karma-cli && \
    yarn cache clean && \ 
    apk del .build-deps
