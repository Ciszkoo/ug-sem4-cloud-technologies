FROM busybox:latest

WORKDIR /app

RUN echo "Hello World!" > index.html

RUN echo "Host: $(hostname)" >> index.html

CMD [ "sleep", "30" ]