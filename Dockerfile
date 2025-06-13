#
# Amber Collect Dockerfile
#

# release stage
FROM node:lts-alpine AS release-stage

ENV AMBER_VISIT_VERSION=1.2.0

WORKDIR /app

RUN set -x && \
  wget -q -O amber-visit.zip https://github.com/obiba/amber-visit/archive/refs/tags/${AMBER_VISIT_VERSION}.zip && \
  unzip -q amber-visit.zip && \
  rm amber-visit.zip && \
  mv amber-visit-${AMBER_VISIT_VERSION}/* . && \
  mv amber-visit-${AMBER_VISIT_VERSION}/.yarn* . && \
  mv amber-visit-${AMBER_VISIT_VERSION}/.eslint* . && \
  rm -rf amber-visit-${AMBER_VISIT_VERSION}
