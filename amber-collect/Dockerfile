#
# Amber Collect Dockerfile
#

# release stage
FROM node:20-alpine as release-stage

ENV AMBER_COLLECT_BRANCH main

WORKDIR /app

RUN set -x && \
  wget -q -O amber-collect.zip https://github.com/obiba/amber-collect/archive/refs/heads/${AMBER_COLLECT_BRANCH}.zip && \
  unzip -q amber-collect.zip && \
  rm amber-collect.zip && \
  mv amber-collect-${AMBER_COLLECT_BRANCH}/* . && \
  mv amber-collect-${AMBER_COLLECT_BRANCH}/.yarn* . && \
  mv amber-collect-${AMBER_COLLECT_BRANCH}/.eslint* amber-collect-${AMBER_COLLECT_BRANCH}/.postcssrc.js . && \
  rm -rf amber-collect-${AMBER_COLLECT_BRANCH}
