#
# Amber Collect Dockerfile
#

# release stage
FROM node:18-alpine as release-stage

ENV AMBER_VISIT_BRANCH main

WORKDIR /app

RUN set -x && \
  wget -q -O amber-visit.zip https://github.com/obiba/amber-visit/archive/refs/heads/${AMBER_VISIT_BRANCH}.zip && \
  unzip -q amber-visit.zip && \
  rm amber-visit.zip && \
  mv amber-visit-${AMBER_VISIT_BRANCH}/* . && \
  mv amber-visit-${AMBER_VISIT_BRANCH}/.eslint* . && \
  rm -rf amber-visit-${AMBER_VISIT_BRANCH}
