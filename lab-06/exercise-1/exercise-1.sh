#!/bin/bash

network_name="my_bridge"
container_name="my_container"

docker network create --subnet 192.168.1.1/24 $network_name

docker run -d --name $container_name --network $network_name nginx

ping -c 5 192.168.1.1

docker network inspect $network_name | grep "Subnet" | tr -d '[:space:]' && echo

docker stop $container_name
docker rm $container_name
docker network rm $network_name