FROM node:latest
WORKDIR /app
COPY package.json .
RUN npm i
COPY src/app.js .
CMD [ "node", "app.js" ]