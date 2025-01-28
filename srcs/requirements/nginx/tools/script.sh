#!/bin/sh

# // Generate certificate and private key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $TLS_KEY -out $TLS_CERT -subj "/C=FR/L=PO/O=42perpignan/OU=student/CN=$WP_URL"

# // Edit config file
sed -i -r "s|WP_URL|$WP_URL|g" /etc/nginx/sites-available/default
sed -i -r "s|TLS_CERT|$TLS_CERT|g" /etc/nginx/sites-available/default
sed -i -r "s|TLS_KEY|$TLS_KEY|g" /etc/nginx/sites-available/default

# // Start nginx
nginx -g "daemon off;"