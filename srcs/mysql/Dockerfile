FROM alpine

ENV MYSQL_ROOT_PASSWORD=password

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client

RUN adduser mysql root
RUN addgroup mysql mysql
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:root /var/lib/mysql
RUN chown -R mysql:root /run/mysqld

COPY database.sql /home/root/database.sql
COPY run.sh /home/root/run.sh

EXPOSE 3306

CMD sh /home/root/run.sh