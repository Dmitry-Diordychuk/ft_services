FROM alpine

ENV PMA_HOST=mysql
ENV MYSQL_ROOT_PASSWORD=password

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

RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.4-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-5.0.4-all-languages.tar.gz \
&& rm phpMyAdmin-5.0.4-all-languages.tar.gz \
&& mv phpMyAdmin-5.0.4-all-languages phpmyadmin \
&& mv phpmyadmin /www

RUN mv config.inc.php /www/phpmyadmin/config.inc.php

EXPOSE 5000

COPY run.sh /home/run.sh
CMD sh /home/run.sh