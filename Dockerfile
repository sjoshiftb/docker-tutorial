FROM node:19-alpine as builder

WORKDIR /usr/app

COPY package.json /usr/app/

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html