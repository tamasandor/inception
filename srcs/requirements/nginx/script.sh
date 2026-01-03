#!/bin/sh


if [ ! -e .flag ]; then
    echo Initial set up doesn\'t exist. Setting up initial nginx config...
    echo Replacing __DOMAIN_NAME__ to $DOMAIN_NAME

    sed -i "s/__DOMAIN_NAME__/$DOMAIN_NAME/g" /etc/nginx/nginx.conf
    echo Replacing __WORDPRESS_CONTAINER_NAME__ to $WORDPRESS_CONTAINER_NAME
    sed -i "s/__WORDPRESS_CONTAINER_NAME__/$WORDPRESS_CONTAINER_NAME/g" /etc/nginx/nginx.conf

    echo Setting up self signed certification...
    openssl req -newkey rsa:4096 \
                -x509 \
                -sha256 \
                -days 365 \
                -nodes \
                -out 42.crt \
                -keyout 42.key \
                -subj "/CN=$DOMAIN_NAME"

    touch .flag
else
    echo Initial configuration already exists.
fi

echo Starting nginx...
exec nginx -g "daemon off;"
