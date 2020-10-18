FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client

RUN adduser -S mysqluser -G mysql
RUN addgroup mysql mysql
RUN mkdir -p /run/mysqld

COPY database /home/root/database
COPY run.sh /home/root/run.sh
#CMD [ "tail", "-f", "/dev/null" ]
CMD sh /home/root/run.sh