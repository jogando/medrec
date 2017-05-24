#!/bin/bash
###############EMPLOYEES#################
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "jdoe@test.com", "firstName": "John", "lastName": "Doe" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "esmith@test.com", "firstName": "Eric", "lastName": "Smith" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "jperez@test.com", "firstName": "Jackson", "lastName": "Perez" }' 'http://localhost:3000/api/Employee'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.Employee", "email": "fmitchel@test.com", "firstName": "Francis", "lastName": "Mitchel" }' 'http://localhost:3000/api/Employee'

###############MEDICAL EMPLOYEES#################
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ "$class": "org.idb.medrec.MedicalEmployee", "email": "medemployee@test.com", "firstName": "Medical", "lastName": "Employee"}' 'http://localhost:3000/api/MedicalEmployee'

###############HEALTH SHEETS#################
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{ 
   "$class": "org.idb.medrec.HealthSheet", 
   "hsid": "1",  
   "chronicConditions": [  
     "none"  
   ],  
   "riskFactors": [  
     "none" 
   ],  
   "allergies": [  
     "none"  
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
   "employee": "jdoe%40test.com"  
 }' 'http://localhost:3000/api/HealthSheet'