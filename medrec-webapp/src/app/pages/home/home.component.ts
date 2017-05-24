import { Component } from '@angular/core';
import { Configuration } from '../../app.constants';
import { Http, Response, Headers, RequestOptions } from '@angular/http';
import { Observable, ReplaySubject } from 'rxjs/Rx';
import {ComposerService} from '../../services/composer.service';
import {Employee} from '../../models/composer';

@Component({
    selector: 'ngbd-buttons-checkbox',
    templateUrl: './home.component.html'
})
export class HomeComponent {
    private headers: Headers;
    private requestOptions: RequestOptions;
    searchItems_Employee: Employee[];
    model = {
        left: true,
        middle: false,
        right: false
    };

    constructor(private config:Configuration,private http: Http, private composerService: ComposerService){
        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
        this.headers.append('Accept', 'application/json');

        this.requestOptions = new RequestOptions({ headers: this.headers});
    }

    requestResults(){
        this.composerService.listEmployees()
            .subscribe(
                data => {
                    this.searchItems_Employee = data;
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


    private handleError (error: Response | any) {
        let errMsg: string;
        if (error instanceof Response) {
            const body = error.json() || '';
            const err = body.error || JSON.stringify(body);
            errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
        } else {
            errMsg = error.message ? error.message : error.toString();
        }
        console.error(errMsg);
        return Observable.throw(errMsg);
    }
}
