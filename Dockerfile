# Use a Node base image
FROM node:slim

# Set working directory
WORKDIR /app

# Copy files
COPY package*.json ./
COPY . .

# Install dependencies
RUN npm install

# Build the app
RUN npm run build

# Use a lightweight web server to serve static files
RUN npm install -g serve

# Serve build folder
CMD ["serve", "-s", "dist", "-l", "3000"]
