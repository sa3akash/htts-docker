FROM certbot/certbot

# Install a minimal Nginx server
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean

# Copy the management script
COPY manage-certificates.sh /usr/local/bin/manage-certificates.sh
RUN chmod +x /usr/local/bin/manage-certificates.sh

# Copy a minimal Nginx configuration for handling ACME challenges
COPY nginx-challenge.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 80

# Run the script periodically
ENTRYPOINT ["/bin/sh", "-c", "trap exit TERM; while :; do /usr/local/bin/manage-certificates.sh; sleep 12h; done;"]
