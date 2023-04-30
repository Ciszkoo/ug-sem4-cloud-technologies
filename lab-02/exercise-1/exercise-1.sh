#!/bin/bash

imageName="lab02ex1"
containerName="my_container"
port="8080"

docker build -t $imageName .

docker run --name $containerName -p $port:$port -d $imageName

echo "Waiting for app to start..."
while ! docker logs $containerName | grep -q "Server is running"; do
  sleep 1
done

curl http://localhost:$port

docker stop $containerName

docker rm $containerName
