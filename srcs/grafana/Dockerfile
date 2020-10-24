FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY run.sh /home/run.sh
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3000

CMD sh /home/run.sh