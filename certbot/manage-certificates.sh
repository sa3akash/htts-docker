#!/bin/sh
# This script will check if the certificates exist and renew or obtain them accordingly

# Start the minimal Nginx server for handling ACME challenges
nginx -c /etc/nginx/nginx.conf

# Obtain new certificates or renew existing ones
certbot certonly --webroot --webroot-path=/var/www/certbot --email "$CERTBOT_EMAIL" --agree-tos --no-eff-email --domains $CERTBOT_DOMAINS

# Stop the Nginx server
nginx -s stop

# Reload Nginx in the main container to apply the new certificates
# docker-compose exec nginx nginx -s reload
