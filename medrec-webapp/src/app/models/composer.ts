export class Employee{
    username:string;
    email:string;
    firstName:string;
    lastName:string;
    gender:string;
    dateOfBirth:string;
    maritalStatus:string;
    emergencyNumber:string;
    phoneNumber:string;
    profilePicUrl:string;
}

export class MedicationRecord{
    date:string;
    medication:string;
    appearance:string;
    quantity:number;
    startDate:string;
    endDate:string;
}

export class DoctorVisit{
    date:string;
    diagnosis:string;
    medication:string;
    durationOfMedication:number;
    results:string;
}

export class HealthSheet{
    hsid:string;
    email:string;
    chronicConditions:string[];
    riskFactors:string[];
    allergies:string[];
    other:string[];
    medicationRecords:MedicationRecord[];
    doctorVisits:DoctorVisit;
}