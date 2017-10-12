#!/bin/bash


#https://scotch.io/tutorials/create-a-mean-app-with-angular-2-and-docker-compose
cd ../../medrec-webapp
#docker build -t angular-client:dev .

docker run -d --name angular-client -p 4200:4200 angular-client:dev