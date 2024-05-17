Docker Amber
============

[Docker](https://docs.docker.com/) images for Amber server and apps, see: [amber](https://github.com/obiba/amber), [amber-studio](https://github.com/obiba/amber-studio), [amber-collect](https://github.com/obiba/amber-collect) and [amber-visit](https://github.com/obiba/amber-visit).

These are base images that needs to be extended up for amending and building the apps.

A template repository is provided to showcase how to extend and customize these Docker images: [amber-template](https://github.com/obiba/amber-template)

Amber server Dockerfile
-----------------------

Amber server is a [nodejs](https://nodejs.org/) application. Most of the runtime parameters can be set using [environment variables]((https://github.com/obiba/amber/blob/main/README.md#environment-variables)). For advanced usage, the runtime settings **can** also be amended by copying a local [./config/production.json](https://github.com/obiba/amber/blob/main/config/production.json) file.

The `Dockerfile` for a production Amber server will then look like: [Amber Server template](https://github.com/obiba/amber-template/tree/master/amber)
