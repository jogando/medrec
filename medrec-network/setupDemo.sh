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
   "profilePicUrl": "profilePic/1.png"  
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
   "profilePicUrl": "profilePic/3.png"  
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
   "profilePicUrl": "profilePic/2.png"  
 }' 'http://localhost:3000/api/Employee'

 #Health Sheets
 #jsmith
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:jsmith",  
   "chronicConditions": [  
     "Hypertension"  
   ],  
   "riskFactors": [  
     "Coronary Artery Disease"  
   ],  
   "allergies": [  
     "Penicilin",
     "Codein"    
   ],  
   "other": [  
     "TPE"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "05/06/2017",  
       "medication": "Aspirin",  
       "appearance": "White",  
       "quantity": 2,  
       "startDate": "05/06/2017",  
       "endDate": "05/06/2017",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "05/06/2016",  
       "diagnosis": "Everything is ok",  
       "medication": "none",  
       "durationOfMedication": "none",  
       "results": "",  
       "id": ""  
     },
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "15/07/2017",  
       "diagnosis": "High cholesterol levels",  
       "medication": "Atorvastatin",  
       "durationOfMedication": "6 months",  
       "results": "",  
       "id": ""  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:jsmith"  
 }' 'http://localhost:3000/api/HealthSheet'

#eclayton
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
     "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:eclayton",  
   "chronicConditions": [  
     "Asthma"  
   ],  
   "riskFactors": [  
     "Kidney disease"  
   ],  
   "allergies": [  
     "Peanuts"
   ],  
   "other": [  
     "JTR"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "05/06/2017",  
       "medication": "Aspirin",  
       "appearance": "White",  
       "quantity": 2,  
       "startDate": "05/06/2017",  
       "endDate": "05/06/2017",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "15/07/2017",  
       "diagnosis": "High cholesterol levels",  
       "medication": "Atorvastatin",  
       "durationOfMedication": "6 months",  
       "results": "",  
       "id": ""  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:eclayton"
   }' 'http://localhost:3000/api/HealthSheet'

#mjohnson
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:mjohnson",  
   "chronicConditions": [  
     "Diabetes"  
   ],  
   "riskFactors": [  
     "Genetics"  
   ],  
   "allergies": [  
     "Shellfish"  
   ],  
   "other": [  
     "POE2"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "05/06/2017",  
       "medication": "Aspirin",  
       "appearance": "White",  
       "quantity": 2,  
       "startDate": "05/06/2017",  
       "endDate": "05/06/2017",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "05/06/2016",  
       "diagnosis": "Everything is ok",  
       "medication": "none",  
       "durationOfMedication": "none",  
       "results": "",  
       "id": ""  
     },
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "15/07/2017",  
       "diagnosis": "High cholesterol levels",  
       "medication": "Atorvastatin",  
       "durationOfMedication": "6 months",  
       "results": "",  
       "id": ""  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:mjohnson"  
 }' 'http://localhost:3000/api/HealthSheet'

 #UPDATE HEALTHSHEET
 #jsmith
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.UpdateHealthSheet",  
   "healthSheet": {  
     "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:jsmith",  
   "chronicConditions": [  
     "Hypertension"  
   ],  
   "riskFactors": [  
     "Coronary Artery Disease"  
   ],  
   "allergies": [  
     "Penicilin",
     "Codein"    
   ],  
   "other": [  
     "TPE"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "05/06/2017",  
       "medication": "Aspirin",  
       "appearance": "White",  
       "quantity": 2,  
       "startDate": "05/06/2017",  
       "endDate": "05/06/2017",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "05/06/2016",  
       "diagnosis": "Everything is ok",  
       "medication": "none",  
       "durationOfMedication": "none",  
       "results": "",  
       "id": ""  
     },
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "15/07/2017",  
       "diagnosis": "High cholesterol levels",  
       "medication": "Atorvastatin",  
       "durationOfMedication": "6 months",  
       "results": "",  
       "id": ""  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:jsmith"
   }  
 }' 'http://localhost:3000/api/UpdateHealthSheet'

#eclayton
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.UpdateHealthSheet",  
   "healthSheet": {  
     "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:eclayton",  
   "chronicConditions": [  
     "Asthma"  
   ],  
   "riskFactors": [  
     "Kidney disease"  
   ],  
   "allergies": [  
     "Peanuts"
   ],  
   "other": [  
     "JTR"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "05/06/2017",  
       "medication": "Aspirin",  
       "appearance": "White",  
       "quantity": 2,  
       "startDate": "05/06/2017",  
       "endDate": "05/06/2017",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "15/07/2017",  
       "diagnosis": "High cholesterol levels",  
       "medication": "Atorvastatin",  
       "durationOfMedication": "6 months",  
       "results": "",  
       "id": ""  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:eclayton"
   }  
 }' 'http://localhost:3000/api/UpdateHealthSheet'

 #mjohnson
 curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' -d '{  
   "$class": "org.idb.medrec.UpdateHealthSheet",  
   "healthSheet": {  
     "$class": "org.idb.medrec.HealthSheet",  
   "hsid": "hsid:mjohnson",  
   "chronicConditions": [  
     "Hypertension"  
   ],  
   "riskFactors": [  
     "Coronary Artery Disease"  
   ],  
   "allergies": [  
     "Penicilin",
     "Codein"    
   ],  
   "other": [  
     "TPE"  
   ],  
   "medicationRecords": [  
     {  
       "$class": "org.idb.medrec.MedicationRecord",  
       "date": "05/06/2017",  
       "medication": "Aspirin",  
       "appearance": "White",  
       "quantity": 2,  
       "startDate": "05/06/2017",  
       "endDate": "05/06/2017",  
       "id": "string"  
     }  
   ],  
   "doctorVisits": [  
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "05/06/2016",  
       "diagnosis": "Everything is ok",  
       "medication": "none",  
       "durationOfMedication": "none",  
       "results": "",  
       "id": ""  
     },
     {  
       "$class": "org.idb.medrec.DoctorVisit",  
       "date": "15/07/2017",  
       "diagnosis": "High cholesterol levels",  
       "medication": "Atorvastatin",  
       "durationOfMedication": "6 months",  
       "results": "",  
       "id": ""  
     }  
   ],  
   "employee": "resource:org.idb.medrec.Employee#username:mjohnson"
   }  
 }' 'http://localhost:3000/api/UpdateHealthSheet'