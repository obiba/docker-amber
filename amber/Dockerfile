#
# Amber server Dockerfile
#

FROM node:22-alpine

ENV AMBER_VERSION=1.4.1

WORKDIR /usr/src/app

RUN set -x && \
  wget -q -O amber.zip https://github.com/obiba/amber/archive/refs/tags/${AMBER_VERSION}.zip && \
  unzip -q amber.zip && \
  rm amber.zip && \
  mv amber-${AMBER_VERSION} amber

WORKDIR /usr/src/app/amber

RUN echo -n "npm: " && npm -version && npm install

EXPOSE 3030

CMD ["npm", "run", "start"]
