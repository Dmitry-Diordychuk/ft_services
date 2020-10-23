sed -i 's/target_password/'"$MYSQL_ROOT_PASSWORD"'/g' /www/phpmyadmin/config.inc.php
sed -i 's/localhost/'"$PMA_HOST"'/g' /www/phpmyadmin/config.inc.php
php-fpm7 -D ; nginx -g "daemon off;"