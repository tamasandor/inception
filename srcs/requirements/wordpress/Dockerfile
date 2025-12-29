FROM alpine:3.22

RUN apk update && apk upgrade && \
        apk add php83-fpm && \ 
        apk add php83-mysqli && \
        apk add php && apk add php-phar && \
        apk add php83-mbstring

RUN mkdir -p /usr/share/webapps/
WORKDIR /usr/share/webapps
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz

# set up wp cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

ADD ./script.sh ./script.sh

ENTRYPOINT ["sh", "./script.sh"]