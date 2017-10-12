#!/bin/bash

#https://stackoverflow.com/questions/45443859/how-to-add-multiple-peers-in-fabric-composer
composer identity import -p hlfv1 -u PeerAdmin -c ./fabric-scripts/hlfv1/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k ./fabric-scripts/hlfv1/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/a55eb519d9b4c661480be13165e81deb2d97a0fcc97613413104f94391dc1189_sk

composer archive create -a ../dist/my-network.bna --sourceType dir --sourceName ../.

#Org1---------------------------
composer network deploy -a ../dist/my-network.bna -p hlfv1 -i PeerAdmin -s randomString