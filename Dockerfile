ARG NODE_VERSION=20.10.0
FROM node:${NODE_VERSION}-alpine as builder
WORKDIR /app
# install app dependencies
COPY package.json .
RUN npm install --silent
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html