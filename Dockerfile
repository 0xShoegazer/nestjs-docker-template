# syntax=docker/dockerfile:1

FROM node:18

WORKDIR /app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Copy the .env and files
COPY .env ./

# RUN npm run migrate:deploy

# Creates a "dist" folder with the production build
RUN npm run build

# Expose the port on which the app will run
EXPOSE 3001

CMD [ "npm", "run", "start:prod" ]