#!/bin/bash

image_names=("business-logic-service" "auth-service" "io-service" "prediction-service")

HUB_USERNAME="meduard"
docker login -u "${HUB_USERNAME}" -p "${HUB_PASSWORD}"

for i in ${image_names[@]}
do
    cd "$i"
    docker build -t $i .
    docker tag $i:latest $HUB_USERNAME/$i:latest
    docker push $HUB_USERNAME/$i:latest
    cd -
done
