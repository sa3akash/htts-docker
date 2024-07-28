#!/bin/bash

# Function to request initial certificates
request_initial_certificates() {
    if [ -n "$DOMAINS" ] && [ -n "$EMAIL" ]; then
        certbot --nginx --non-interactive --agree-tos --email "$EMAIL" -d "$DOMAINS"
    else
        echo "DOMAINS and EMAIL environment variables must be set"
        exit 1
    fi
}

# Start Nginx
nginx

# Request initial certificates
request_initial_certificates

# Start cron daemon
crond -f