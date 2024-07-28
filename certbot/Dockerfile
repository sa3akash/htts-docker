FROM nginx:alpine

# Install Certbot and other required packages
RUN apk add --no-cache certbot certbot-nginx bash

# Copy the script that handles certificate renewal
COPY renew_certs.sh /usr/local/bin/renew_certs.sh
RUN chmod +x /usr/local/bin/renew_certs.sh

# Copy the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Copy the cron job configuration
COPY crontab /etc/crontabs/root

# Expose ports 80 and 443
EXPOSE 80 443

# Use the custom entrypoint script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]