#!/bin/bash
id=$(docker create $1)
echo $id
docker cp $id:/stage1.html stage1.html
docker rm -v $id
