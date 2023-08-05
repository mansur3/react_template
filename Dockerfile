# FROM node:18-alpine

# ENV PORT 3000


# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# # Installing dependencies
# COPY package*.json /usr/src/app/
# RUN yarn install

# # Copying source files
# COPY . /usr/src/app

# # Building app
# RUN yarn run build
# EXPOSE 3000

# # Running the app
# CMD ["yarn", "start"]
# Stage 1: Build React application
FROM node:18-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React application
RUN npm run build

# Stage 2: Serve the built React application
FROM nginx:alpine

# Copy the built React application from the build stage to the Nginx web root
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to access the application
EXPOSE 80

