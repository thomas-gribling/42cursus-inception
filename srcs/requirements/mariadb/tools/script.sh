#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysqld_safe < db1.sql

service mariadb start