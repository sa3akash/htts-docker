
---

### Docker Image Description: Nginx with Certbot for Automatic SSL Renewal

**Image Name:** `sa2avroo/nginx-certbot:latest`

**Description:**
This Docker image provides a lightweight Nginx server with the Certbot utility for obtaining and renewing SSL certificates automatically. It is designed for users who want to set up a secure web server with minimal hassle. The image can be used for creating a production-ready application with HTTPS support.

**Features:**
- **Nginx:** A high-performance web server that serves static and dynamic web content.
- **Certbot:** An easy-to-use client that helps you obtain and renew Let's Encrypt SSL certificates automatically.
- **Automatic Renewal:** Cron jobs are set up to handle SSL certificate renewal without manual intervention.
- **Lightweight:** Built on a minimal base image to reduce overhead.
- **Volume Support:** Configurable to support volume mounts for custom Nginx configurations and web content.
- 

**Usage:**
1. **Build Image:**
   ```sh
   docker pull sa2avroo/nginx-certbot:latest
   ```

2. **Run Container:**
   ```sh
   docker run -d \
     --name nginx-certbot \
     -p 80:80 \
     -p 443:443 \
     -v /nginx.conf:/etc/nginx/conf.d \
     -v ./certbot/conf:/etc/letsencrypt \
     -v ./certbot/www:/var/www/certbot \
     sa2avroo/nginx-certbot:latest
   ```

3. **Configuration:**
   - Place your Nginx configuration files in the `nginx.conf` directory.
   - Ensure that your DNS points to the server where you're running the container.


4. **Automatic Renewal:**
   The Docker container is configured to execute a cron job that renews the certificate every day. Monitor the logs to ensure the process runs smoothly.

5. **Handle automatic ssl:**
   This docker image handle https nginx.conf automatic.

**Environment Variables:**
- `NGINX_EMAIL`: Email used for Let's Encrypt registration and renewal notifications.
- `NGINX_DOMAINS`: Comma-separated list of domains handled by the server.

**Example Dockerfile compose:**
```dockerfile
  nginx-certbot:
    image: sa2avroo/nginx-certbot:latest
    container_name: nginx-certbot
    ports:
      - "80:80"
      - "443:443"
    environment:
      - EMAIL=sa2avroo@gmail.com
      - DOMAINS=npm.fr.to,apii.fr.to
    volumes:
      - ./certbot/conf:/etc/letsencrypt
      - ./certbot/www:/var/www/certbot
      - ./nginx.conf:/etc/nginx/nginx.conf
    depends_on:
      - app # depends on client or api services
```

**Example nginx.conf:**
```dockerfile
events {
    worker_connections 1024;
}

http {
    server_tokens off;
    charset utf-8;

    upstream client {
        server app:3001;
    }
    upstream server {
        server api:5000;
    }

    server {
        listen 80;
        server_name npm.fr.to; # change your domain

        location / {
            proxy_pass http://client;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        location /.well-known/acme-challenge/ {
            proxy_pass http://client;
        }
    }
    server {
        listen 80;
        server_name apii.fr.to; # change your domain

        location / {
            proxy_pass http://server;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        location /.well-known/acme-challenge/ {
            proxy_pass http://server;
        }
    }
}
```

# 
This is a [image link](https://hub.docker.com/repository/docker/sa2avroo/nginx-certbot/general/)


**Note:** Be sure to replace placeholders (like `yourdomain.com`) with your actual domain and ensure that your server is publicly accessible for Certbot to validate the domain ownership.

---

