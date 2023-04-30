#!/bin/bash

image_name="lab05ex1"

docker build -t $image_name .

docker run --rm $image_name