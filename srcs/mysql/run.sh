sed -i 's/password/'"$MYSQL_ROOT_PASSWORD"'/g' /home/root/database.sql
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
mysqld --user=root --datadir=/var/lib/mysql --bind-address=0.0.0.0 --port=3306 --skip-networking=false --wait_timeout=600 --max_allowed_packet=64M & sleep 10
mysql < /home/root/database.sql & sleep 5
mysql wordpress < /home/root/dump.sql & sleep 5
telegraf

while true; do foo; sleep 2; done
