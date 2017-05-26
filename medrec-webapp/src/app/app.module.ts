
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';

// external module
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule, Http } from '@angular/http';
import { RouterModule } from '@angular/router';
import { environment } from '../environments/environment';
import { CookieModule } from 'ngx-cookie';


let modules = [
    BrowserModule,
    FormsModule,
    HttpModule,
    RouterModule,
    CookieModule.forRoot(),
    NgbModule.forRoot()
];


import { AppComponent } from './app.component';


import { UserService } from './services/user.service';
import { CanActivateGuard } from './services/guard.service';
import { ComposerService } from './services/composer.service';
import { UtilService } from './services/util.service';

import {Configuration} from './app.constants';

let services = [
    UserService,
    CanActivateGuard,
    Configuration,
    ComposerService,
    UtilService
];

// les pages
import { HomeComponent } from './pages/home/home.component';
import { HealthSheetComponent } from './pages/health-sheet/health-sheet.component';
import { CharListComponent } from './pages/health-sheet/char-list/char-list.component';
import { AddMedicationRecordComponent } from './pages/health-sheet/add-medication-record/add-medication-record.component';
import { LayoutsAuthComponent } from './pages/layouts/auth/auth';
import { LoginComponent } from './pages/login/login.component';



let pages = [
    AppComponent,
    HomeComponent,
    HealthSheetComponent,
    CharListComponent,
    AddMedicationRecordComponent,
    LayoutsAuthComponent,
    LoginComponent
];

// main bootstrap
import { routing } from './app.routes';

@NgModule( {
    bootstrap: [AppComponent],
    declarations: [
        ...pages
    ],
    imports: [
        ...modules,
        routing
    ],
    providers: [
        ...services
    ]
})
export class AppModule { }
