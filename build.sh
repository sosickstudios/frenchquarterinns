#!/bin/bash

docker build -t builder .

cd dist/

docker build -t webapp .

docker run -it --rm builder -v "$PWD":/frenchquarterinns
docker run -d --name webserver -p 80:80 webapp

echo curl http://127.0.0.1