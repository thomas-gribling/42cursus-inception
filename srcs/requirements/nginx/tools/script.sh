#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $TLS_KEY -out $TLS_CERT -subj "/C=FR/L=PO/O=42perpignan/OU=student/CN=$WP_URL"

sed -i -r "s/WP_URL/$WP_URL/g" /etc/nginx/sites-available/default

echo "127.0.0.1   www.$WP_URL  $WP_URL" >> /etc/hosts

nginx -g "daemon off;"
