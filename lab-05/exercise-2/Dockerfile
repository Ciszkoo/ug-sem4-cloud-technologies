FROM node:latest

WORKDIR /app

COPY app/package.json .

RUN npm install

COPY app/app.js .

CMD [ "node", "app.js" ]