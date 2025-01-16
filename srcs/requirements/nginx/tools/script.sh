#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $TLS_KEY -out $TLS_CERT -subj "/C=FR/L=PO/O=42/OU=student/CN=$WP_URL"

echo "
server {
	listen 443 ssl;
	listen [::]:443 ssl;

	server_name www.$WP_URL $WP_URL;

	ssl_certificate $TLS_CERT;
	ssl_certificate_key $TLS_KEY;
	ssl_protocols TLSv1.3;

	index index.php;
	root /var/www/html;" > /etc/nginx/sites-available/default

echo '

	location ~ [^/]\.php(/|$) {
		try_files $uri = 404;
		fastcgi_pass wordpress:9000;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}
} ' >> /etc/nginx/sites-available/default

nginx -g "daemon off;"
