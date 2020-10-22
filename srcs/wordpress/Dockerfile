FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add php7 php7-bcmath php7-dom php7-ctype php7-curl php7-fileinfo php7-fpm php7-gd php7-iconv php7-intl php7-json php7-mbstring php7-mcrypt php7-mysqlnd php7-opcache php7-openssl \
        php7-pdo php7-pdo_mysql php7-pdo_pgsql php7-pdo_sqlite php7-phar php7-posix php7-simplexml php7-session php7-soap php7-tokenizer php7-xml php7-xmlreader php7-xmlwriter php7-zip
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN mkdir /working_dir
RUN mkdir /run/nginx
WORKDIR /working_dir
COPY . /working_dir
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv nginx.conf /etc/nginx/nginx.conf

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& rm latest.tar.gz \
&& mv wordpress/ /www/

EXPOSE 5050

CMD php-fpm7 -D ; nginx -g "daemon off;"