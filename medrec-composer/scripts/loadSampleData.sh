#!/bin/bash
###############EMPLOYEES#################
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "jdoe@test.com", "firstName": "John", "lastName": "Doe" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "esmith@test.com", "firstName": "Eric", "lastName": "Smith" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "jperez@test.com", "firstName": "Jackson", "lastName": "Perez" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "fmitchel@test.com", "firstName": "Francis", "lastName": "Mitchel" }' 'http://localhost:3000/api/Employee'

###############MEDICAL EMPLOYEES#################
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.MedicalEmployee", "email": "medemployee@test.com", "firstName": "Medical", "lastName": "Employee"}' 'http://localhost:3000/api/MedicalEmployee'
