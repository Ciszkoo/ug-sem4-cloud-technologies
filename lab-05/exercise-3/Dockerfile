ARG PYTHON_VERSION=latest
FROM python:${PYTHON_VERSION}

WORKDIR /app

COPY app/. .

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "app.py" ]