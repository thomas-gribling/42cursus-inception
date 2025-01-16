#!/bin/bash

mkdir /var/www
mkdir /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/database/$DB_NAME/1" wp-config.php # // line 23
sed -i -r "s/database/$DB_USER/1" wp-config.php # // line 26
sed -i -r "s/database/$DB_PASS/1" wp-config.php # // line 29

sed -i -r "s/localhost/mariadb/1" wp-config.php # // line 32

wp core install --url=$WP_URL/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_enail=$WP_ADMIN_MAIL --skip-email --allow-root
wp user create $WP_USER $WP_MAIL --role=author --user_pass=$WP_PASS --allow-root

#wp theme install redis-cache --activate --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

mkdir /run/php

#wp redis enable --allow-root

/usr/sbin/php-fpm7.4 -F