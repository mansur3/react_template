FROM node:18-alpine

ENV PORT 3000

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Installing dependencies
COPY package*.json /usr/src/app/
RUN yarn install

# Copying source files
COPY . /usr/src/app

# Building app
RUN yarn run build
EXPOSE 3000

# Running the app
CMD ["yarn", "start"]


