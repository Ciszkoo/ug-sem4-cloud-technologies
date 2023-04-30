#!/bin/bash

imageName="lab01ex8"
conatinerName="my_container"

docker build -t $imageName .

docker run --rm -d --name $conatinerName $imageName

docker cp $conatinerName:/app/index.html .