FROM alpine:3.22

RUN apk update && apk upgrade && \
    apk add mariadb mariadb-client


COPY ./script.sh /home/script.sh
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

ENTRYPOINT [ "sh", "/home/script.sh"]