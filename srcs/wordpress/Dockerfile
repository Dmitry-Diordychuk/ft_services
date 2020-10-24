FROM alpine:latest

ENV WORDPRESS_DB_HOST=mysql
ENV WORDPRESS_DB_PASSWORD=password

WORKDIR /working_dir
COPY . /working_dir

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

COPY run.sh /home/run.sh
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir /run/nginx
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv nginx.conf /etc/nginx/nginx.conf

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& rm latest.tar.gz \
&& mv wordpress/ /www/

RUN mv wp-config.php /www/wordpress/wp-config.php

EXPOSE 5050

COPY run.sh /home/run.sh
CMD sh /home/run.sh