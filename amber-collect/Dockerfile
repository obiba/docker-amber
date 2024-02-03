#
# Amber Collect Dockerfile
#

# release stage
FROM node:20-alpine as release-stage

ENV AMBER_COLLECT_VERSION 1.1.0

WORKDIR /app

RUN set -x && \
  wget -q -O amber-collect.zip https://github.com/obiba/amber-collect/archive/refs/tags/${AMBER_COLLECT_VERSION}.zip && \
  unzip -q amber-collect.zip && \
  rm amber-collect.zip && \
  mv amber-collect-${AMBER_COLLECT_VERSION}/* . && \
  mv amber-collect-${AMBER_COLLECT_VERSION}/.yarn* . && \
  mv amber-collect-${AMBER_COLLECT_VERSION}/.eslint* amber-collect-${AMBER_COLLECT_VERSION}/.postcssrc.js . && \
  rm -rf amber-collect-${AMBER_COLLECT_VERSION}
