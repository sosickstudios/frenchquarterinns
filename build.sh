#!/bin/bash

echo "Building BUILD image"
docker build -t builder .

cd ../

echo "Starting BUILD container"
docker run -it --rm -v "$PWD":/frenchquarterinns builder

cd dist/

cd "Building WEBAPP image"
docker build -t webapp .

echo "Starting WEBSERVER container"
docker run -d --name webserver -p 80:80 webapp

echo curl http://127.0.0.1