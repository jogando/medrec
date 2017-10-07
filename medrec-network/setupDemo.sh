#!/bin/bash

#POST THE EMPLOYEES
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.Employee",  
   "username": "username:jsmith",  
   "email": "jsmith@test.com", 
   "firstName": "John",  
   "lastName": "Smith",  
   "gender": "Male",  
   "dateOfBirth": "04/03/1974",  
   "maritalStatus": "Single",  
   "emergencyNumber": "(202) 432 9483",  
   "phoneNumber": "(202) 332 4166",  
   "profilePicUrl": "string"  
 }' 'http://localhost:3000/api/Employee'

 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.Employee",  
   "username": "username:eclayton",  
   "email": "eclayton@test.com", 
   "firstName": "Eric",  
   "lastName": "Clayton",  
   "gender": "Male",  
   "dateOfBirth": "12/03/1965",  
   "maritalStatus": "Married",  
   "emergencyNumber": "(202) 223 5435",  
   "phoneNumber": "(202) 993 1235",  
   "profilePicUrl": "string"  
 }' 'http://localhost:3000/api/Employee'

  curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.Employee",  
   "username": "username:mjohnson",  
   "email": "mjohnson@test.com", 
   "firstName": "Martha",  
   "lastName": "Johnson",  
   "gender": "Female",  
   "dateOfBirth": "10/06/1969",  
   "maritalStatus": "Married",  
   "emergencyNumber": "(202) 433 1234",  
   "phoneNumber": "(202) 345 9949",  
   "profilePicUrl": "string"  
 }' 'http://localhost:3000/api/Employee'

 #Health Sheets

 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:1",  
   "chronicConditions": [  
     "string"  
   ],  
   "riskFactors": [  
     "string"  
   ],  
   "allergies": [  
     "string"  
   ],  
   "other": [  
     "string"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "string",  
       "medication": "string",  
       "appearance": "string",  
       "quantity": 0,  
       "startDate": "string",  
       "endDate": "string",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "string",  
       "diagnosis": "string",  
       "medication": "string",  
       "durationOfMedication": "string",  
       "results": "string",  
       "id": "string"  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:jsmith"  
 }' 'http://localhost:3000/api/HealthSheet'