#
# Amber server Dockerfile
#

FROM node:lts-alpine

ENV AMBER_BRANCH main

WORKDIR /usr/src/app

RUN set -x && \
  wget -q -O amber.zip https://github.com/obiba/amber/archive/refs/heads/${AMBER_BRANCH}.zip && \
  unzip -q amber.zip && \
  rm amber.zip && \
  mv amber-${AMBER_BRANCH} amber

WORKDIR /usr/src/app/amber

RUN echo -n "npm: " && npm -version && npm install

EXPOSE 3030

CMD ["npm", "run", "start"]
