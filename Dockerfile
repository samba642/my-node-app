# Use the official Node.js image
FROM node:20

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app's code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to start the app
CMD ["node", "index.js"]

