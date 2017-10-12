import { Component, OnInit } from '@angular/core';
import { Configuration } from '../../app.constants';
import { Router, ActivatedRoute } from '@angular/router';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import {ComposerService} from '../../services/composer.service';
import {UtilService} from '../../services/util.service';
import {Employee, HealthSheet} from '../../models/composer';

declare var $:any;

@Component({
    selector: 'health-sheet',
    templateUrl: './health-sheet.component.html'
})
export class HealthSheetComponent implements OnInit {
    private headers: Headers;
    private requestOptions: RequestOptions;


    employee: Employee;
    originalHealthSheet:HealthSheet;
    healthSheet:HealthSheet;
    updateHealthsheetTransactionLog:any[];
    isEdit:boolean;
    isShowTransactionLog:boolean;
    selectedVersion:string;
    isCurrentVersion:boolean;

    constructor(private config:Configuration,
        private http: Http, 
        private composerService: ComposerService,
        private route: ActivatedRoute,
        private utilService: UtilService){

        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
        this.headers.append('Accept', 'application/json');

        this.requestOptions = new RequestOptions({ headers: this.headers});
    }

    ngOnInit(){
        this.route.params.subscribe(params => {
            this.isEdit = false;
            this.isShowTransactionLog = false;
            this.employee = null;
            this.healthSheet = null;
            this.originalHealthSheet = null;
            let username = params["id"];
            this.selectedVersion = params["version"];

            this.isCurrentVersion = this.selectedVersion == "current";

            //this.requestHealthSheet(username);
            this.requestEmployee(username);
            this.requestUpdateHealthsheetTransactionLog(username);
        });
    }

    /*
    requestHealthSheet(username:string){
        this.composerService.getHealthSheetByUsername(username)
            .subscribe(
                data => {
                    this.healthSheet = data;
                    this.originalHealthSheet = JSON.parse(JSON.stringify(data));//create a copy
                    
                }, 
                error => {
                    console.log(error)
                }
            );
    }*/

    requestEmployee(username:string){
        this.composerService.getEmployeeByUsername(username)
            .subscribe(
                data => {
                    this.employee = data;
                }, 
                error => {
                    console.log(error)
                }
            );
    }

    requestSaveChanges(){
        this.composerService.updateHealthSheet(this.healthSheet)
            .subscribe(
                data => {
                    $("#modalSaveChanges").modal('hide');
                }, 
                error => {
                    console.log(error)
                }
            );
    }

    requestUpdateHealthsheetTransactionLog(username:string){
        var selectedVersion = this.selectedVersion;
        this.composerService.getUpdateHealthsheetTransactionLog(username)
            .subscribe(
                data => {
                    this.updateHealthsheetTransactionLog = data;
                    data.sort(function(a,b){
                        return new Date(a.timestamp).getTime() - new Date(b.timestamp).getTime();
                    });
                    var healthSheet = null;
                    if(this.selectedVersion =="current"){
                        healthSheet = data[data.length-1].healthSheet;
                    }else{
                        healthSheet = data.filter(i=>i.transactionId == selectedVersion)[0].healthSheet;
                    }

                    this.healthSheet = healthSheet;
                    this.originalHealthSheet = JSON.parse(JSON.stringify(healthSheet));

                }, 
                error => {
                    console.log(error)
                }
            );
    }

    filterEmployeeResults(results:Employee[], query:string){
        if(query == null || query == ""){
            return results;
        }
    }

    toggleEdit(){
        this.isEdit = !this.isEdit;
    }

    toggleTransactionLog(){
        this.isShowTransactionLog = !this.isShowTransactionLog;
    }

    onChronicConditionAdded($event){
        this.healthSheet.chronicConditions.push($event);
    }

    onRiskFactorAdded($event){
        this.healthSheet.riskFactors.push($event);
    }

    onAllegieAdded($event){
        this.healthSheet.allergies.push($event);
    }

    onOtherAdded($event){
        this.healthSheet.other.push($event);
    }

    onChronicConditionRemoved($event){
        this.healthSheet.chronicConditions
            .splice(this.healthSheet.chronicConditions.indexOf($event), 1);
    }

    onRiskFactorRemoved($event){
        this.healthSheet.riskFactors
            .splice(this.healthSheet.riskFactors.indexOf($event), 1);
    }

    onAllergieRemoved($event){
        this.healthSheet.allergies
            .splice(this.healthSheet.allergies.indexOf($event), 1);
    }

    onOtherRemoved($event){
        this.healthSheet.other
            .splice(this.healthSheet.other.indexOf($event), 1);
    }

    onMedicationRecordAdded($event){
        $("#addMedicationRecordModal").modal('hide');
        this.healthSheet.medicationRecords.push($event);
    }

    showNewMedicationRecord(){
        $("#addMedicationRecordModal").modal('show');
    }

    showSaveChanges(){
        $("#modalSaveChanges").modal('show');
    }

}
