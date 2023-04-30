#!/bin/bash

docker volume create nodejs_data

docker run -d -v nodejs_data:/app --name my-nodejs node

docker run --rm -v nodejs_data:/app alpine sh -c 'echo "Hello, world!" > /app/file.txt'

docker volume create all_volumes

docker run --rm -v nginx_data:/from -v all_volumes:/to alpine ash -c "cd /from ; cp -a . /to"

docker run --rm -v nodejs_data:/from -v all_volumes:/to alpine ash -c "cd /from ; cp -a . /to"