#!/bin/bash

image_name="lab05ex4"
container_name="my_container"

docker volume create my_data

docker build -t $image_name --build-arg python_version=3 .

docker run -dt -p 8000:8000 -v my_data:/data --name $container_name $image_name

while ! docker logs $container_name | grep -q "Debugger PIN"; do
  sleep 1
done

curl -w "\n" http://localhost:8000

docker stop $container_name
docker rm $container_name
