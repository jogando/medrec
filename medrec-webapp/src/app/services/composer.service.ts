import { User } from '../models/user';
import { Injectable } from '@angular/core';
import { Observable, ReplaySubject } from 'rxjs/Rx';
import { Router } from '@angular/router';
import { Configuration } from '../app.constants';
import { Http, Response, Headers, RequestOptions } from '@angular/http';

import * as ComposerModels from '../models/composer';

@Injectable()
export class ComposerService {

    private headers: Headers;
    private requestOptions: RequestOptions;

    constructor(
      private router: Router
      , private config: Configuration
      , private http: Http
    ) {
        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
        this.headers.append('Accept', 'application/json');

        this.requestOptions = new RequestOptions({ headers: this.headers });
    }

    listEmployees(): Observable<ComposerModels.Employee[]>{
        let url = this.config.server+"/Employee";

        return this.http.get(url,this.requestOptions)
            .map((res: Response)=>{
                return res.json();
            })
            .catch(this.handleError);
    }

    getEmployeeByUsername(username:string): Observable<ComposerModels.Employee>{
        let url = this.config.server+"/Employee/"+username;

        return this.http.get(url,this.requestOptions)
            .map((res: Response)=>{
                return res.json();
            })
            .catch(this.handleError);
    }

    getUpdateHealthsheetTransactionLog(username:string): Observable<any>{
        let url = this.config.server+"/UpdateHealthSheet";

        return this.http.get(url,this.requestOptions)
            .map((res: Response)=>{
                return res.json();
            }).map((items)=>{
                var employeeId = "resource:org.idb.medrec.Employee#"+username;
                return items.filter(i=>i.healthSheet.employee==employeeId);
            })
            .catch(this.handleError);
    }

    getHealthSheetByUsername(username:string): Observable<ComposerModels.HealthSheet>{
        let url = this.config.server+"/HealthSheet";

        return this.http.get(url,this.requestOptions)
            .map((res: Response)=>{
                return res.json();
            }).map((items)=>{
                var employeeId = "resource:org.idb.medrec.Employee#"+username;
                return items.filter(i=>i.employee==employeeId)[0];
            })
            .catch(this.handleError);
    }

    updateHealthSheet(healthSheet:ComposerModels.HealthSheet): Observable<ComposerModels.Employee>{
        let url = this.config.server+"/UpdateHealthSheet";

        var payload = {
            healthSheet: healthSheet
        };

        return this.http.post(url,JSON.stringify(payload),this.requestOptions)
            .map((res: Response)=>{
                return res.json();
            })
            .catch(this.handleError);
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
