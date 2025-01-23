#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $TLS_KEY -out $TLS_CERT -subj "/C=FR/L=PO/O=42perpignan/OU=student/CN=$WP_URL"

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
	location / {
		try_files \$uri \$uri/ /index.php?\$args;
	}

	location ~ [^/]\.php(/|$) {
		try_files $uri = 404;
		fastcgi_pass wordpress:9000;
		include fastcgi_params;
		fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	}

	error_page 404 /404.html;
	error_page 500 502 503 504 /50x.html;
} ' >> /etc/nginx/sites-available/default

nginx -g "daemon off;"
