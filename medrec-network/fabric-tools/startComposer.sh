#!/bin/bash

#https://stackoverflow.com/questions/45443859/how-to-add-multiple-peers-in-fabric-composer
composer identity import -p hlfv1 -u PeerAdmin -c ./fabric-scripts/hlfv1/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k ./fabric-scripts/hlfv1/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/a55eb519d9b4c661480be13165e81deb2d97a0fcc97613413104f94391dc1189_sk

composer archive create -a ../dist/my-network.bna --sourceType dir --sourceName ../.

#Org1---------------------------
composer network deploy -a ../dist/my-network.bna -p hlfv1 -i PeerAdmin -s randomString


source envvars0.txt
docker run \
    -d \
    -e COMPOSER_CONNECTION_PROFILE=${COMPOSER_CONNECTION_PROFILE} \
    -e COMPOSER_BUSINESS_NETWORK=${COMPOSER_BUSINESS_NETWORK} \
    -e COMPOSER_ENROLLMENT_ID=${COMPOSER_ENROLLMENT_ID} \
    -e COMPOSER_ENROLLMENT_SECRET=${COMPOSER_ENROLLMENT_SECRET} \
    -e COMPOSER_NAMESPACES=${COMPOSER_NAMESPACES} \
    -e COMPOSER_AUTHENTICATION=${COMPOSER_AUTHENTICATION} \
    -e COMPOSER_MULTIUSER=${COMPOSER_MULTIUSER} \
    -e COMPOSER_CONFIG="${COMPOSER_CONFIG}" \
    -e COMPOSER_DATASOURCES="${COMPOSER_DATASOURCES}" \
    -e COMPOSER_PROVIDERS="${COMPOSER_PROVIDERS}" \
    --name composer-rest0 \
    --network composer_default \
    --mount type=bind,source=/home/ubuntu/.composer-credentials,target=/home/composer/.composer-credentials \
    -p 3000:3000 \
    hyperledger/composer-rest-server

source envvars1.txt
docker run \
    -d \
    -e COMPOSER_CONNECTION_PROFILE=${COMPOSER_CONNECTION_PROFILE} \
    -e COMPOSER_BUSINESS_NETWORK=${COMPOSER_BUSINESS_NETWORK} \
    -e COMPOSER_ENROLLMENT_ID=${COMPOSER_ENROLLMENT_ID} \
    -e COMPOSER_ENROLLMENT_SECRET=${COMPOSER_ENROLLMENT_SECRET} \
    -e COMPOSER_NAMESPACES=${COMPOSER_NAMESPACES} \
    -e COMPOSER_AUTHENTICATION=${COMPOSER_AUTHENTICATION} \
    -e COMPOSER_MULTIUSER=${COMPOSER_MULTIUSER} \
    -e COMPOSER_CONFIG="${COMPOSER_CONFIG}" \
    -e COMPOSER_DATASOURCES="${COMPOSER_DATASOURCES}" \
    -e COMPOSER_PROVIDERS="${COMPOSER_PROVIDERS}" \
    --name composer-rest1 \
    --network composer_default \
    --mount type=bind,source=/home/ubuntu/.composer-credentials,target=/home/composer/.composer-credentials \
    -p 3001:3000 \
    hyperledger/composer-rest-server

    sleep 15

    ../setupDemo.sh