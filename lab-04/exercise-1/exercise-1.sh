#!/bin/bash

url="http://localhost:80"
volume="nginx_data"

docker compose up -d

docker run --rm -d -v $volume:/my_temp alpine:latest sh -c 'echo Hello World! > /my_temp/index.html'

sleep 5
curl -w "\n" $url

docker compose down