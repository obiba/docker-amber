Docker Amber
============

[Docker](https://docs.docker.com/) images for Amber server and apps, see: [amber](https://github.com/obiba/amber), [amber-studio](https://github.com/obiba/amber-studio) and [amber-collect](https://github.com/obiba/amber-collect).

These are base images that needs to be extended up for amending and building the apps.

A template repository is provided to showcase how to extend and customize these Docker images: [amber-template](https://github.com/obiba/amber-template)


Amber server Dockerfile
-----------------------

Amber server is a [nodejs](https://nodejs.org/) application. Most of the runtime parameters can be set using [environment variables]((https://github.com/obiba/amber/blob/main/README.md#environment-variables)). For advanced usage, the runtime settings **can** also be amended by copying a local [./config/production.json](https://github.com/obiba/amber/blob/main/config/production.json) file.

The `Dockerfile` for a production Amber server will then look like: [Amber Server template](https://github.com/obiba/amber-template/tree/master/amber)


Amber Studio app Dockerfile
---------------------------

Amber Studio is a [Quasar SPA](https://quasar.dev/quasar-cli-vite/developing-spa/introduction) (single page application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-studio/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-studio/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-studio/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

The `Dockerfile` for a production web server providing the Amber Studio app will then look like: [Amber Studio template](https://github.com/obiba/amber-template/tree/master/amber-studio)

Amber Collect app Dockerfile
----------------------------

Amber Collect is a [Quasar PWA](https://quasar.dev/quasar-cli-vite/developing-pwa/introduction) (progressive web application) web app delivered by a [NGINX](https://www.nginx.com/) web server. The web app **must** be built with the site specific settings such as the Amber server URL and the [reCAPTCHA](https://developers.google.com/recaptcha/) site key.

Optionally, some source files can be modified as well:

* [settings.json](https://github.com/obiba/amber-collect/blob/main/settings.json) file that is a simple way of tweaking the default theme and for adding new languages.
* [public](https://github.com/obiba/amber-collect/tree/main/public) folder that contains the app icons.
* [src/css](https://github.com/obiba/amber-collect/tree/main/src/css) folder that contains the [SCSS](https://sass-lang.com/documentation/syntax) files.

The `Dockerfile` for a production web server providing the Amber Collect app will then look like: [Amber Collect template](https://github.com/obiba/amber-template/tree/master/amber-collect)
