FROM ubuntu:latest AS build

RUN apt-get update && apt-get install -y curl git
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs

WORKDIR /app

COPY app/package.json .

RUN npm install

COPY app/ .

RUN npm run build


FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]

