FROM nginx:latest

RUN mkdir /certs

COPY certificate.crt /certs/certificate.crt

COPY private.key /certs/private.key

COPY nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]