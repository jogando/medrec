#!/bin/bash
###############EMPLOYEES#################
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "username":"jdoe", "email": "jdoe@test.com", "firstName": "John", "lastName": "Doe", "gender":"Male", "dateOfBirth":"01/05/1961", "maritalStatus":"Single", "emergencyNumber":"(202) 476 8372", "phoneNumber":"(202) 384 1254", "profilePicUrl":"profilePic/1" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "username":"esmith", "email": "esmith@test.com", "firstName": "Eric", "lastName": "Smith", "gender":"Male", "dateOfBirth":"08/01/1969", "maritalStatus":"Married", "emergencyNumber":"(202) 943 9475", "phoneNumber":"(202) 847 5356", "profilePicUrl":"profilePic/4" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "username":"jperez", "email": "jperez@test.com", "firstName": "Jackson", "lastName": "Perez", "gender":"Male", "dateOfBirth":"11/08/1970", "maritalStatus":"Married", "emergencyNumber":"(202) 284 1364", "phoneNumber":"(202) 544 1666", "profilePicUrl":"profilePic/3" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "username":"lcarhill", "email": "lcarhill@test.com", "firstName": "Linda", "lastName": "Carhill", "gender":"Female", "dateOfBirth":"04/06/1971", "maritalStatus":"Single", "emergencyNumber":"(202) 474 5477", "phoneNumber":"(202) 777 4356", "profilePicUrl":"profilePic/2" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "username":"dmorgan", "email": "dmorgan@test.com", "firstName": "Debra", "lastName": "Morgan", "gender":"Female", "dateOfBirth":"10/05/1980", "maritalStatus":"Married", "emergencyNumber":"(202) 333 5334", "phoneNumber":"(202) 485 1238", "profilePicUrl":"profilePic/5" }' 'http://localhost:3000/api/Employee'

###############MEDICAL EMPLOYEES#################
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.MedicalEmployee", "email": "medemployee@test.com", "firstName": "Medical", "lastName": "Employee"}' 'http://localhost:3000/api/MedicalEmployee'

###############HEALTH SHEETS#################
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ 
   "$class": "org.idb.medrec.HealthSheet", 
   "hsid": "1",  
   "chronicConditions": [  
     "headache"  
   ],  
   "riskFactors": [  
     "salt" 
   ],  
   "allergies": [  
     "pollem"  
   ],  
   "other": [  
     "none"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "2016-01-01",  
       "medication": "none",  
       "appearance": "none",  
       "quantity": 0,
       "startDate": "2016-01-01", 
       "endDate": "2016-01-02" 
     }  
   ], 
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "2016-12-01",  
       "diagnosis": "headache",  
       "medication": "aspirin",  
       "durationOfMedication": "2 weeks",  
       "results": "ok"  
     }  
   ],  
   "employee": "jdoe"  
 }' 'http://localhost:3000/api/HealthSheet'