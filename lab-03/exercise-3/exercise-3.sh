#!/bin/bash

url="https://localhost:443"
app_container_name="my_app_container"
work_dir=$(pwd)

openssl req -nodes -x509 -newkey rsa:4096 -keyout "$work_dir"/nginx/private.key -out "$work_dir"/nginx/certificate.crt -days 365 -subj '/CN=localhost' 2> /dev/null

docker compose up -d

echo "Waiting for an app..."
while ! docker logs $app_container_name | grep -q "Server is running on"; do
  sleep 1
done

curl -w "\n" -k $url

docker compose down