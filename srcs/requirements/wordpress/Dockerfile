FROM alpine:3.22

RUN apk update && apk upgrade && \
        apk add php83-fpm && \ 
        apk add php83-mysqli && \
        apk add php && apk add php-phar && \
        apk add php83-mbstring && \
        apk add mariadb-client && \
        apk add php83-gd

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp



ADD ./script.sh ./script.sh

ENTRYPOINT ["sh", "./script.sh"]