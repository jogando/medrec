import { Component } from '@angular/core';
import { Configuration } from '../../app.constants';

@Component({
    selector: 'ngbd-buttons-checkbox',
    templateUrl: './home.component.html'
})
export class HomeComponent {
    searchItems: SearchItem[];
    model = {
        left: true,
        middle: false,
        right: false
    };

    constructor(private config:Configuration){
        
    }

    requestResults(){
        let url = this.config.server+"/user/login";

        return this.http.post(url,JSON.stringify(requestData),this.requestOptions)
            .map((res: Response)=>{
                return res.json().payload;
            })
            .catch(this.handleError);
    }
}

class SearchItem {

}