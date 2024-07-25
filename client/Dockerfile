FROM node:alpine as build

WORKDIR /usr/src/client

COPY package*.json .

RUN yarn --quiet --production

COPY . .

RUN npm build  


# nginx
FROM nginx:latest

EXPOSE 3000
COPY ./nginx /etc/nginx/conf.d
COPY --from=build /usr/src/client/dist /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]