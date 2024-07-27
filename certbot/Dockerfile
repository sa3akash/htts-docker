FROM debian:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
        nginx \
        certbot \
        python3-certbot-nginx \
        cron \
        && apt-get clean

# Copy configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY manage-certificates.sh /usr/local/bin/manage-certificates.sh

# Make the script executable
RUN chmod +x /usr/local/bin/manage-certificates.sh

# Expose ports for HTTP and HTTPS
EXPOSE 80 443

# Setup cron job for certificate renewal
RUN echo "0 0 * * * /usr/local/bin/manage-certificates.sh >> /var/log/cron.log 2>&1" > /etc/cron.d/certbot-renewal

# Start Nginx and cron in the foreground
CMD ["sh", "-c", "nginx && cron && tail -f /var/log/nginx/access.log /var/log/nginx/error.log /var/log/cron.log"]
