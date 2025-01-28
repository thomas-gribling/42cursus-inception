#!/bin/sh

# // Will retry to execute the script if an error occurs
set -e

# // Launch mysql in background and wait for it to start
mysqld_safe &
sleep 10

# // Create a temporary file that will init our database and user
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME ;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS' ;" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS' ;" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql -uroot -p"$DB_ROOT_PASS" < db.sql
rm db.sql

# // Restart mysql
mysqladmin -uroot -p"$DB_ROOT_PASS" shutdown
mysqld