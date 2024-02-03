#
# Amber Studio Dockerfile
#

# release stage
FROM node:20-alpine as release-stage

ENV AMBER_STUDIO_BRANCH main

WORKDIR /app

RUN set -x && \
  wget -q -O amber-studio.zip https://github.com/obiba/amber-studio/archive/refs/heads/${AMBER_STUDIO_BRANCH}.zip && \
  unzip -q amber-studio.zip && \
  rm amber-studio.zip && \
  mv amber-studio-${AMBER_STUDIO_BRANCH}/* . && \
  mv amber-studio-${AMBER_STUDIO_BRANCH}/.yarn* . && \
  mv amber-studio-${AMBER_STUDIO_BRANCH}/.eslint* amber-studio-${AMBER_STUDIO_BRANCH}/.postcssrc.js . && \
  rm -rf amber-studio-${AMBER_STUDIO_BRANCH}
