import { Injectable } from '@angular/core';

@Injectable()
export class Configuration {
    public server: string = 'http://192.168.1.105:3000/api';
    public apiUrl: string = 'php-crud-api/api.php/';
    public serverWithApiUrl = this.server + this.apiUrl;
}
