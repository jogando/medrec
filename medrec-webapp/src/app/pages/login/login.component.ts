import { Component, OnInit, OnDestroy } from '@angular/core';
import { User } from '../../models/user';
import { UserService } from '../../services/user.service';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html'
})
export class LoginComponent implements OnInit {
  private password: string;
  private email: string;

  constructor(
    private userService: UserService,
    private router: Router,
    private cookieService:CookieService
  ) {
  }

  public ngOnInit() {
    window.dispatchEvent( new Event( 'resize' ) );
    //this.login();
  }

  private login() {

    // test les champs en js

    // envoyer les champs a php

    // si retour positif, log le user
    if ( 1 === 1 ) {

      var loginRequest = {username:this.email, password:this.password};
      /*this.userService.login(loginRequest)
            .subscribe(
                data => {
                    localStorage.setItem('token', data.token);
                    localStorage.setItem('pouchdbUrl', data.pouchdbUrl);
                    this.dbService.init();

                    let user1 = new User( {
                        avatarUrl: 'public/assets/img/user2-160x160.jpg',
                        email: this.email,
                        firstname: 'firstname',
                        lastname: 'lastname'
                    });

                    user1.connected = true;

                    this.userService.setCurrentUser( user1 );

                    this.router.navigate( ['home'] );
                },
                error => {}
            );*/

      
    } else {
      // je recupere l'erreur du php
      // et on le place dans un label, ou un toaster
    }


  }

}
