#!/bin/bash

image_name="lab05ex3"

echo "Image with default version of Python"
docker build -t $image_name .
docker run --rm $image_name

echo "Image with custom version of Python"
docker build -t $image_name --build-arg PYTHON_VERSION=3.8 .
docker run --rm $image_name