FROM alpine:latest

ARG python_version port=8000

ENV PYTHON_VERSION=$python_version PORT=$port

RUN apk update && apk add --no-cache python${PYTHON_VERSION} py-pip

WORKDIR /app

COPY app/ .

RUN pip install --no-cache-dir -r requirements.txt

VOLUME [ "/data" ]

EXPOSE ${PORT}

CMD [ "sh", "-c", "python${PYTHON_VERSION} app.py" ]