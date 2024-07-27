#!/bin/sh
# This script will check if the certificates exist and renew or obtain them accordingly

# Obtain new certificates or renew existing ones
certbot certonly --webroot --webroot-path=/var/www/certbot --email $CERTBOT_EMAIL --agree-tos --no-eff-email --domains $CERTBOT_DOMAINS

# Reload Nginx to apply the new certificates
nginx -s reload
