FROM certbot/certbot

# Install additional packages or tools if needed (use apk for Alpine)
RUN apk add --no-cache nginx

# Copy the manage-certificates.sh script into the container
COPY manage-certificates.sh /usr/local/bin/manage-certificates.sh
RUN chmod +x /usr/local/bin/manage-certificates.sh

# Copy minimal Nginx config for ACME challenge
COPY nginx-challenge.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/bin/sh", "-c", "trap exit TERM; while :; do /usr/local/bin/manage-certificates.sh; sleep 24h; done;"]
