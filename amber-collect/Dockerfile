#
# Amber Collect Dockerfile
#

# release stage
FROM node:lts-alpine as release-stage

ENV AMBER_COLLECT_VERSION 1.0.1

WORKDIR /app

RUN set -x && \
  wget -q -O amber-collect.zip https://github.com/obiba/amber-collect/archive/refs/tags/${AMBER_COLLECT_VERSION}.zip && \
  unzip -q amber-collect.zip && \
  rm amber-collect.zip && \
  mv amber-collect-${AMBER_COLLECT_VERSION}/* . && \
  mv amber-collect-${AMBER_COLLECT_VERSION}/.eslint* amber-collect-${AMBER_COLLECT_VERSION}/.postcssrc.js . && \
  rm -rf amber-collect-${AMBER_COLLECT_VERSION}

RUN yarn global add @quasar/cli
