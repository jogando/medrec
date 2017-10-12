import { Injectable } from '@angular/core';

declare var window:any;

@Injectable()
export class Configuration {
    public server: string = '/api';
    public composerEventsURL: string = "ws://"+window.location.host+'/ws';
    public apiUrl: string = 'php-crud-api/api.php/';
    public serverWithApiUrl = this.server + this.apiUrl;
}
