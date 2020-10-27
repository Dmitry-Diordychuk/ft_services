FROM alpine

ENV MYSQL_ROOT_PASSWORD=password

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add supervisor

COPY run.sh /home/run.sh
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN adduser mysql root
RUN addgroup mysql mysql
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql:root /var/lib/mysql
RUN chown -R mysql:root /run/mysqld

COPY database.sql /home/root/database.sql
COPY dump.sql /home/root/dump.sql
COPY run.sh /home/root/run.sh

EXPOSE 3306

COPY supervisor.conf /etc/supervisor.conf
#CMD sh /home/root/run.sh ; supervisord -c /etc/supervisor.conf
CMD supervisord -c /etc/supervisor.conf