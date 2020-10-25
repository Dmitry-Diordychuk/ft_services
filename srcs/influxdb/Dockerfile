FROM alpine

#ENV TELEGRAF_VERSION 1.16
#ENV INFLUXDB_DATABASE=monitoring
#ENV INFLUXDB_USERNAME=root
#ENV INFLUXDB_PASSWORD=password
#ENV INFLUXDB_HOST=grafana-influxdb

RUN apk update
RUN apk upgrade
RUN apk add influxdb
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY run.sh /home/run.sh
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8086

CMD sh /home/run.sh

#/etc/influxdb/influxdb.conf
#/etc/influxdb/influxdb.conf:ro