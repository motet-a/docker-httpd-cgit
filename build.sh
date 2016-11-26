#!/bin/sh -ex

docker build -f Dockerfile.base -t httpd-cgit-base .
docker build -f Dockerfile.build -t httpd-cgit-build .

id=$(docker create httpd-cgit-build)

build_path=/usr/src/cgit/cgit

mkdir build-output
cd build-output
docker cp $id:$build_path/cgit .
docker cp $id:$build_path/cgit.css .
docker cp $id:$build_path/cgit.png .
docker cp $id:$build_path/robots.txt .
docker cp $id:$build_path/favicon.ico .
cd ..

docker rm -v $id
docker build -f Dockerfile.run -t httpd-cgit .
rm -rf build-output
