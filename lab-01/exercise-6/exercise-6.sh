#!/bin/bash

imageName="lab01ex06"

docker build -t $imageName .

docker run --rm $imageName