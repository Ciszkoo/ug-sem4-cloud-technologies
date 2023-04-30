#!/bin/bash

content=$1
image_name="lab03ex1"
container_name="my_container"

docker build -t $image_name .

docker run --name $container_name -p 80:80 -d $image_name

container_ip=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $container_name)

if [ -n "$content" ]; then
  echo "$content" | docker exec -i $container_name sh -c 'cat > /usr/share/nginx/html/index.html'
fi

sleep 10
echo "The webpage is accessible at http://$container_ip:80"
curl http://localhost:80

docker stop $container_name
docker rm $container_name
