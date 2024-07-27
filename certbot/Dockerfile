FROM certbot/certbot

# Copy the management script
COPY manage-certificates.sh /usr/local/bin/manage-certificates.sh
RUN chmod +x /usr/local/bin/manage-certificates.sh

# Run the script periodically
ENTRYPOINT ["/bin/sh", "-c", "trap exit TERM; while :; do /usr/local/bin/manage-certificates.sh; sleep 12h; done;"]
