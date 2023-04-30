FROM node:12

WORKDIR /app

COPY app/package.json .

RUN npm install

COPY app/app.js .

EXPOSE 8080

CMD [ "node", "app.js" ]