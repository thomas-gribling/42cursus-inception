#!/bin/sh

# // Setup directories for WP
mkdir -p /var/www
mkdir -p /var/www/html
cd /var/www/html

# // Download WP-CLI (WordPress Command Line Interface) and setup an alias
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# // Download WordPress
wp core download --allow-root

# // Edit config file
cp wp-config-sample.php wp-config.php
sed -i -r "s|database_name_here|$DB_NAME|1" wp-config.php # // line 23
sed -i -r "s|username_here|$DB_USER|1" wp-config.php # // line 26
sed -i -r "s|password_here|$DB_PASS|1" wp-config.php # // line 29
sed -i -r "s|localhost|mariadb|1" wp-config.php # // line 32
sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf

# // Install WP and config Admin and User
wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS --allow-root

# // Setup and run PHP
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F