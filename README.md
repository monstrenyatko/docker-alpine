Alpine base Docker image
========================

[![Build Status](https://travis-ci.com/monstrenyatko/docker-alpine.svg?branch=master)](https://travis-ci.com/monstrenyatko/docker-alpine)


About
=====

[Alpine Linux](https://alpinelinux.org/) `Docker` base image.

Upstream Links
--------------
* Docker Registry @[monstrenyatko/alpine](https://hub.docker.com/r/monstrenyatko/alpine/)
* GitHub @[monstrenyatko/docker-alpine](https://github.com/monstrenyatko/docker-alpine)

Build own image
===============

* `default` target platform:

  ```sh
    cd <path to sources>
    DOCKER_BUILDKIT=1 docker build --tag <tag name> .
  ```
* `arm/v6` target platform:

  ```sh
    cd <path to sources>
    DOCKER_BUILDKIT=1 docker build --platform=linux/arm/v6 --tag <tag name> .
  ```
