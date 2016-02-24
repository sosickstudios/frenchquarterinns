#!/bin/bash

echo "Building BUILD image"
docker build -t builder .

echo "Starting BUILD container"
docker run -it --rm -v "$PWD":/frenchquarterinns builder

cd dist/

echo "Building WEBAPP image"
docker build -t webapp .

echo "Starting WEBSERVER container"
docker run --restart=always -d --name webserver -p 80:80 webapp

servername="http://frenchquarterinns.com"
response=$(curl --write-out %{http_code} --silent --output /dev/null $servername)

if [ $response -eq 200 ]
  then echo "SITE IS ONLINE! YAY!"
  else echo "----SITE IS NOT UP--------"
fi
