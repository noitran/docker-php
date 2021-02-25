#!/bin/sh

# https://serversforhackers.com/c/disable-in-prod
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

set -e

if [ ! true = "$ENABLE_XDEBUG" ]; then
  rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

# From:
# https://github.com/docker-library/php/blob/master/7.4/alpine3.12/fpm/docker-php-entrypoint
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- php-fpm "$@"
fi

exec "$@"
