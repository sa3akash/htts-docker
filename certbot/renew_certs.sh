#!/bin/bash

# Renew the certificates
certbot renew --nginx

# Reload Nginx
nginx -s reload
