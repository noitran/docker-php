#!/bin/sh

# https://serversforhackers.com/c/disable-in-prod
# https://docs.docker.com/develop/develop-images/dockerfile_best-practices/

set -e

if [ ! true = "$ENABLE_XDEBUG" ]; then
    rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
fi

exec "$@"
