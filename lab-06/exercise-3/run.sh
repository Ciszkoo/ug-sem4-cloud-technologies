#!/bin/bash

docker build -t front_img ./front
docker network create --driver bridge front_back
docker run -d -p 80:80 --name front --network front_back front_img

docker network create --driver bridge back_db

docker build -t back_img ./back

docker run -d -p 3000:3000 --name back --network front_back back_img
docker network connect back_db back

docker build -t db_image ./database
docker run -d -p 27170:27017 --name db --network back_db db_image
docker container exec -d db mongoimport --db test --collection mycollection --type json --file /app/data.json --jsonArray
