# <img src="docs/logo.png" alt="Noitran Logo" align="right"> Base PHP Docker Image

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/noitran/docker-php/Github%20Docker%20CI?style=flat-square)
![Docker Pulls](https://img.shields.io/docker/pulls/noitran/php?style=flat-square)

# About

Repository has Dockerfiles with pre-installed PHP extensions:

* pdo_mysql
* pdo_pgsql
* amqp
* sockets
* pcntl
* intl

Tools:

* curl

[Docker Images at Docker Hub](https://hub.docker.com/repository/docker/noitran/php-base/tags?page=1)

## Usage

### Local Build

```bash
$ git clone git@github.com:noitran/docker-php.git
$ make build
```

### Testing image

```bash
$ make test
```

### Pushing to Docker Hub

```bash
$ make docker-push
```
