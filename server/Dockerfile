# # Use a lean Node.js base image
# FROM node:18-alpine AS base
# WORKDIR /app

# # Install dependencies
# COPY package*.json ./
# RUN npm install

# # Build stage
# FROM node:18-alpine AS builder
# WORKDIR /app

# COPY --from=base /app/node_modules ./node_modules
# COPY . .
# RUN npm run build --prod

# # Production stage
# FROM node:alpine AS production
# WORKDIR /app

# # Copy production build
# COPY --from=builder /app/build ./

# # Non-root user
# RUN addgroup --system --gid 1001 nodejs
# RUN adduser --system -u 1001 user

# # Set ownership
# RUN chown -R user:nodejs /app

# USER user

# # Expose port
# EXPOSE 5000

# # Start the app
# CMD ["node", "server.js"]


# Step 1: Use the official Node.js image as a base image  
FROM node:18-alpine AS builder  

# Step 2: Set the working directory in the container  
WORKDIR /app  

# Step 3: Copy package.json and package-lock.json (or yarn.lock) to the working directory  
COPY package*.json ./  
# If you are using yarn, uncomment the next line and comment the npm ci line  
# COPY yarn.lock ./  

# Step 4: Install dependencies  
RUN npm install  
# If you are using yarn, uncomment the next line and comment the npm ci line  
# RUN yarn install --frozen-lockfile  

# Step 5: Copy the rest of your application code  
COPY . .  

# Step 6: Build your application (if necessary)  
# RUN npm run build  # Uncomment if you have a build step (e.g., for TypeScript or React)  

# Step 7: Use a new stage for the production image  
FROM node:18-alpine  

# Step 8: Set the working directory in the production image  
WORKDIR /app  

# Step 9: Copy dependencies and application code from the builder stage  
COPY --from=builder /app .  

# Step 10: Expose the port your app runs on (modify if necessary)  
EXPOSE 5000  

# Step 11: Command to run your application  
CMD ["node", "server.js"]  # Change this to your main entry file