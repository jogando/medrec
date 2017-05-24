import { Component, OnInit } from '@angular/core';
import { Configuration } from '../../app.constants';
import { Router, ActivatedRoute } from '@angular/router';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable, ReplaySubject } from 'rxjs/Rx';
import {ComposerService} from '../../services/composer.service';
import {UtilService} from '../../services/util.service';
import {Employee, HealthSheet} from '../../models/composer';

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

    isEdit:boolean;

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
            this.employee = null;
            this.healthSheet = null;
            this.originalHealthSheet = null;
            let email = params["id"];

            this.requestHealthSheet(email);
            this.requestEmployee(email);
        });
    }

    requestHealthSheet(email:string){
        this.composerService.getHealthSheetByEmployeeEmail(email)
            .subscribe(
                data => {
                    this.healthSheet = data;
                    this.originalHealthSheet = JSON.parse(JSON.stringify(data));//create a copy
                    
                }, 
                error => {
                    console.log(error)
                }
            );
    }

    requestEmployee(email:string){
        this.composerService.getEmployeeByEmail(email)
            .subscribe(
                data => {
                    this.employee = data;
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

}
