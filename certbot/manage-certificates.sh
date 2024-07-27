#!/bin/bash

# Start Nginx to serve the challenge
nginx

# Obtain or renew certificates
certbot --nginx --non-interactive --agree-tos --email ${EMAIL} --domains ${DOMAINS}

# Reload Nginx to apply new certificates
nginx -s reload
