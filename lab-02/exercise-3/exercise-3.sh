#!/bin/bash

url="http://localhost:8080"
containerName="my_container"

docker compose up -d

echo "Waiting for an app..."
while ! docker logs $containerName | grep -q "Server listening on port"; do
  sleep 1
done

curl -X POST -H "Content-Type: application/json" -d '{"message":"Hello World"}' -w "\n" $url
curl -w "\n" $url

docker compose down