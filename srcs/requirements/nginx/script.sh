#!/bin/sh

echo Replacing __DOMAIN_NAME__ to $DOMAIN_NAME

sed -i "s/__DOMAIN_NAME__/$DOMAIN_NAME/g" /etc/nginx/nginx.conf

openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 365 \
            -nodes \
            -out 42.crt \
            -keyout 42.key \
            -subj "/CN=$DOMAIN_NAME"

exec nginx -g "daemon off;"
