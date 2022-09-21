#!/bin/bash
docker stop mongo
docker rm mongo
# cd carpeta de sus datos
export DATA_DIR=`pwd`/data
echo $DATA_DIR
export EX_DIR=`pwd`/mongodb-sample-dataset
echo $EX_DIR
mkdir -p $DATA_DIR
docker run -p 27017:27017 \
       -v $DATA_DIR:/data/db \
       -v $EX_DIR:/mongodb-sample-dataset \
       --name mongo \
       -d mongo
export DHC=$(docker ps -aqf "name=mongo")
sleep 2
docker exec -it $DHC mongosh
