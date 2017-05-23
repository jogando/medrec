import { User } from '../models/user';
import { Injectable } from '@angular/core';
import { Observable, ReplaySubject } from 'rxjs/Rx';
import { Router } from '@angular/router';
import { Configuration } from '../app.constants';
import { Http, Response, Headers, RequestOptions } from '@angular/http';


@Injectable()
export class UserService {
    public currentUser: ReplaySubject<User> = new ReplaySubject<User>( 1 );

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

        this.requestOptions = new RequestOptions({ headers: this.headers});
    }

    public setCurrentUser( user: User ) {
      this.currentUser.next( user );
    }

    public logout() {
      let user = new User();
      user.connected = false;
      this.setCurrentUser( user );
      this.router.navigate(['login']);
    }


    private extractData(res: Response) {
        return res.json();
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
