Docker Amber
============

[Docker](https://docs.docker.com/) images for Amber server and apps, see: [amber](https://github.com/obiba/amber), [amber-studio](https://github.com/obiba/amber-studio) and [amber-collect](https://github.com/obiba/amber-collect).

These are base images that needs to be extended up for amending and building the apps.

Amber server Dockerfile
-----------------------

Amber server is a [nodejs](https://nodejs.org/) application. Most of the runtime parameters can be set using [environment variables]((https://github.com/obiba/amber/blob/main/README.md#environment-variables)). For advanced usage, the runtime settings **can** also be amended by copying a local [./config/production.json](https://github.com/obiba/amber/blob/main/config/production.json) file.

The `Dockerfile` for a production Amber server will then look like:

```
FROM obiba/amber:latest

WORKDIR /usr/src/app/amber

# copy local files into the runtime folder
COPY . .
```

Amber Studio app Dockerfile
---------------------------

Amber Studio is a [Quasar SPA](https://quasar.dev/quasar-cli-vite/developing-spa/introduction) (single page application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-studio/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-studio/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-studio/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

The `Dockerfile` for a production web server providing the Amber Studio app will then look like:

```
# build stage
FROM obiba/amber-studio:latest as build-stage
ARG AMBER_URL
ARG RECAPTCHA_SITE_KEY
WORKDIR /app
# copy local files into the source folder
COPY . .
RUN yarn
RUN quasar build

# production stage
FROM nginx:alpine as production-stage
COPY --from=build-stage /app/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/spa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Amber Collect app Dockerfile
----------------------------

Amber Collect is a [Quasar PWA](https://quasar.dev/quasar-cli-vite/developing-pwa/introduction) (progressive web application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-collect/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-collect/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-collect/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

The `Dockerfile` for a production web server providing the Amber Collect app will then look like:

```
# build stage
FROM obiba/amber-collect:latest as build-stage
ARG AMBER_URL
ARG RECAPTCHA_SITE_KEY
WORKDIR /app
# copy local files into the source folder
COPY . .
RUN yarn
RUN quasar build --mode pwa

# production stage
FROM nginx:alpine as production-stage
COPY --from=build-stage /app/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/dist/pwa /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

Amber Docker Compose
--------------------

The production Docker files described above can be wrapped up by [Docker Compose](https://docs.docker.com/compose/). The following is an example of a production set up:

```
.
├── amber
│   ├── config
│   │   └── production.json
│   └── Dockerfile
├── amber-collect
│   ├── Dockerfile
│   ├── public
│   │   ├── favicon.ico
│   │   └── icons
│   │       ├── android-icon-144x144.png
│   │       └── ...
│   └── settings.json
├── amber-studio
│   ├── Dockerfile
│   ├── public
│   │   ├── favicon.ico
│   │   └── icons
│   │       ├── android-icon-144x144.png
│   │       └── ...
│   └── settings.json
├── .env
└── docker-compose.yml
```

The `docker-compose.yml` file for a production Amber runtime will then look like (environment variables are defined in the `.env` file, see [amber's environment variables](https://github.com/obiba/amber/blob/main/README.md#environment-variables) description):

```
version: '3'
services:
        amber:
                build: ./amber
                ports:
                        - "3030:3030"
                links:
                        - mongo
                environment:
                        - APP_NAME=${APP_NAME}
                        - APP_URL=${AMBER_URL}
                        - APP_SECRET_KEY=${APP_SECRET_KEY}
                        - APP_SECRET_IV=${APP_SECRET_IV}
                        - ENCRYPT_DATA=true
                        - CLIENT_URLS=${AMBER_STUDIO_URL},${AMBER_COLLECT_URL}
                        - MONGODB_URL=mongodb://${MONGO_USER}:${MONGO_PWD}@mongo:27017/amber?authSource=admin
                        - ADMINISTRATOR_EMAIL=${ADMINISTRATOR_EMAIL}
                        - ADMINISTRATOR_PWD=${ADMINISTRATOR_PWD}
                        - AMBER_STUDIO_URL=${AMBER_STUDIO_URL}
                        - AMBER_COLLECT_URL=${AMBER_COLLECT_URL}
                        - RECAPTCHA_SECRET_KEY=${RECAPTCHA_SECRET_KEY}
                        - SENDINBLUE_API_KEY=${SENDINBLUE_API_KEY}
                        - FROM_EMAIL=${FROM_EMAIL}
        amber-studio:
                build:
                        context: ./amber-studio
                        args:
                                - AMBER_URL=${AMBER_URL}
                                - RECAPTCHA_SITE_KEY=${RECAPTCHA_SITE_KEY}
                ports:
                        - "3080:80"
        amber-collect:
                build:
                        context: ./amber-collect
                        args:
                                - AMBER_URL=${AMBER_URL}
                                - RECAPTCHA_SITE_KEY=${RECAPTCHA_SITE_KEY}
                ports:
                        - "3090:80"
        mongo:
                image: mongo
                environment:
                        - MONGO_INITDB_ROOT_USERNAME=${MONGO_USER}
                        - MONGO_INITDB_ROOT_PASSWORD=${MONGO_PWD}
```

Note that in this example the MongoDB server is provided by a Docker image ([mongo](https://hub.docker.com/_/mongo/)), but it could also be externalized.

To build the production Docker images, use the command:

```
docker compose build
```

Then start the Amber server and apps with:

```
docker compose up -d
```
