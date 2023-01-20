#!/bin/bash
container_name=$1
docker_image=$2

set -x

if [ "$(docker ps -a | grep ${container_name})" ]
then
         docker stop ${container_name} > /dev/null 2>&1
         docker rm ${container_name} > /dev/null 2>&1
fi

if [ "${container_name}" = 'pre-prod' ]
then
   docker run -d --name pre-prod -p 81:80 $docker_image
fi


if [ "${container_name}" = "prod" ]
then
   docker run -d --name prod -p 80:80 $docker_image
fi

