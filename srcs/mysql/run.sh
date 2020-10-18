#sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

#/usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql"
#/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
#/usr/bin/mysqld --user=root --bootstrap --verbose=0 < /home/root/database


chown -R mysql:root /var/lib/mysql
chown -R mysql:root /run/mysqld
/usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
mysqld_safe
