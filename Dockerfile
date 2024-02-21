# Use an official Node.js runtime as a base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the entire project to the working directory
COPY . .

# Build the app for production
RUN npm run build

# Expose the port that the app will run on
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
