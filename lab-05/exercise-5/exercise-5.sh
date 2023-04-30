#!/bin/bash

image_name="lab05ex5"
container_name="my_container"

docker build -t $image_name .

docker run -d -p 8080:80 --name $container_name $image_name

sleep 5
curl -w "\n" http://localhost:8080

docker stop $container_name
docker rm $container_name