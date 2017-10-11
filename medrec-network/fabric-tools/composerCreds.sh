#!/bin/bash

#https://stackoverflow.com/questions/45443859/how-to-add-multiple-peers-in-fabric-composer
composer identity import -p hlfv1 -u PeerAdmin -c ./fabric-scripts/hlfv1/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k ./fabric-scripts/hlfv1/composer/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/21e679e85249a923a47e5656f01aace8588ec3d78d610bc04b17ac0076ec21b5_sk