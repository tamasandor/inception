FROM alpine:3.22

RUN apk update && apk upgrade && \
    apk add nginx && apk add openssl

ADD ./script.sh /etc/nginx/ssl_run_nginx.sh
WORKDIR /etc/nginx
ADD conf /etc/nginx/nginx.conf
ENTRYPOINT ["sh", "/etc/nginx/ssl_run_nginx.sh"]