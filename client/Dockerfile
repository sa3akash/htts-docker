FROM node:alpine

WORKDIR /usr/src/client

COPY package*.json .

RUN yarn

COPY . .

CMD [ "yarn", "dev" ]