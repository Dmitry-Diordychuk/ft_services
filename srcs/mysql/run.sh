sed -i 's/password/'"$MYSQL_ROOT_PASSWORD"'/g' /home/root/database.sql
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
mysqld --user=root --datadir=/var/lib/mysql --bind-address=0.0.0.0 --port=3306 --skip-networking=false --wait_timeout=600 & sleep 5
mysql < /home/root/database.sql

while true; do foo; sleep 2; done
