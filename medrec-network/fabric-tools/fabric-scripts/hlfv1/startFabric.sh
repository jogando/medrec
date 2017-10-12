#!/bin/bash

# Exit on first error, print all commands.
set -ev

#Detect architecture
ARCH=`uname -m`

# Grab the current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
cd "${DIR}"/composer

ARCH=$ARCH docker-compose -f "${DIR}"/composer/docker-compose.yml down
ARCH=$ARCH docker-compose -f "${DIR}"/composer/docker-compose.yml up -d

# wait for Hyperledger Fabric to start
# incase of errors when running later commands, issue export FABRIC_START_TIMEOUT=<larger number>
export FABRIC_START_TIMEOUT=15
echo ${FABRIC_START_TIMEOUT}
sleep ${FABRIC_START_TIMEOUT}

pwd

#docker rm -f $(docker ps -aq)
#sudo docker rm -f $(sudo docker ps -aq)

# Create the channel
sudo docker exec peer0.org1.example.com peer channel create -o orderer.example.com:7050 -c composerchannel -f /etc/hyperledger/configtx/composer-channel.tx

#copy the channel block
sudo docker exec peer0.org1.example.com cp ./composerchannel.block /etc/hyperledger/shared

# Join peer0.org1.example.com to the channel.
sudo docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer0.org1.example.com peer channel join -b /etc/hyperledger/shared/composerchannel.block
sudo docker exec -e "CORE_PEER_MSPCONFIGPATH=/etc/hyperledger/msp/users/Admin@org1.example.com/msp" peer1.org1.example.com peer channel join -b /etc/hyperledger/shared/composerchannel.block

#docker run -p 9090:9090 -e HYP_REST_ENDPOINT=http://192.168.0.106:7050 yeasy/blockchain-explorer

cd ../..

#ssh -L 3000:localhost:3000 -i "linux_ubuntu.pem" ubuntu@ec2-52-91-92-243.compute-1.amazonaws.com
#docker exec peer0.org1.example.com peer channel fetch newest -c composerchannel -o orderer.example.com:7050
