FROM node:20-alpine

# Install dependencies for native modules
RUN apk add --no-cache python3 make g++

# Set working directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy all project files
COPY . .

# Generate Nuxt TypeScript configs and prepare
RUN npm run postinstall || npx nuxi prepare

# Expose port
EXPOSE 3000

# Start development server
CMD ["npm", "run", "dev"]