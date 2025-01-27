#!/bin/sh

set -e

mysqld_safe &

sleep 10

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql -uroot -p"$DB_ROOT_PASS" < db.sql
mysqladmin -uroot -p"$DB_ROOT_PASS" shutdown

exec mysqld