#!/bin/bash

image_name="lab04ex2"
container_name="my_container"

docker build -t $image_name .

# default settings
port=80

while getopts ":c:p:" opt; do
  case $opt in
  c)
    config_file="$OPTARG"
    ;;
  p)
    port="$OPTARG"
    ;;
  \?)
    echo "Invalid option: -$OPTARG" >&2
    ;;
  esac
done

docker run --name $container_name -p "$port":80 -d $image_name 

if [ -n "$config_file" ]; then
  docker cp "$(pwd)/$config_file" $container_name:/etc/nginx/
fi

sleep 10
curl -w "\n" http://localhost:"$port"

docker stop $container_name
docker rm $container_name
