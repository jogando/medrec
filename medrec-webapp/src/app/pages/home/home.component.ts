import { Component } from '@angular/core';

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

    constructor(){
        
    }
}

class SearchItem {

}