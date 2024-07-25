# Use a lean Node.js base image
FROM node:18-alpine AS base
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Build stage
FROM node:18-alpine AS builder
WORKDIR /app

COPY --from=base /app/node_modules ./node_modules
COPY . .
RUN npm run build --prod

# Production stage
FROM node:alpine AS production
WORKDIR /app

# Copy production build
COPY --from=builder /app/build ./

# Non-root user
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system -u 1001 user

# Set ownership
RUN chown -R user:nodejs /app

USER user

# Expose port
EXPOSE 5000

# Start the app
CMD ["node", "server.js"]