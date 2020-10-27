if [ ! -d /var/lib/mysql/mysql ]
then
    echo "install mysqldb"
    /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
fi

if [ ! -d /var/lib/mysql/wordpress ]
then
    echo "init mysqldb"
    sed -i 's/password/'"$MYSQL_ROOT_PASSWORD"'/g' /home/root/database.sql
    mysqld --user=root --bootstrap --verbose=0 < /home/root/database.sql 
    mysqld --user=root --bootstrap --verbose=0 < /home/root/dump.sql
fi

if [ -d /var/lib/mysql/wordpress ]
then
    echo "init dump"
    mysqld --user=root --bootstrap --verbose=0 < /home/root/dump.sql
fi

if [ ! -d /run/mysql/mysql.sock ]
then
    echo "start"
    mysqld --user=root --datadir=/var/lib/mysql --bind-address=0.0.0.0 --port=3306 --skip-networking=false
fi
