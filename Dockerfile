#
# Amber Studio Dockerfile
#

# release stage
FROM node:20-alpine as release-stage

ENV AMBER_STUDIO_VERSION 1.3.0

WORKDIR /app

RUN set -x && \
  wget -q -O amber-studio.zip https://github.com/obiba/amber-studio/archive/refs/tags/${AMBER_STUDIO_VERSION}.zip && \
  unzip -q amber-studio.zip && \
  rm amber-studio.zip && \
  mv amber-studio-${AMBER_STUDIO_VERSION}/* . && \
  mv amber-studio-${AMBER_STUDIO_VERSION}/.yarn* . && \
  mv amber-studio-${AMBER_STUDIO_VERSION}/.eslint* amber-studio-${AMBER_STUDIO_VERSION}/.postcssrc.js . && \
  rm -rf amber-studio-${AMBER_STUDIO_VERSION}
