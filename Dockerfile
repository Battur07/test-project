# Use the base image with OpenJDK
FROM node:16-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the necessary files to the container
COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Expose the port on which your application listens
EXPOSE 3000

# Define the command to run your application
CMD ["npm", "start"] 
