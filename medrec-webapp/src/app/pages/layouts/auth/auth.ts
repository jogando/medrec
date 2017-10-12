import { Component, OnInit } from '@angular/core';
import { User } from '../../../models/user';
import { UserService } from '../../../services/user.service';
import { Observable, Subject } from 'rxjs/Rx';
import { Configuration } from '../../../app.constants';
declare var $:any;
@Component({
    selector: 'app-layouts-auth',
    templateUrl: './auth.html'
})
export class LayoutsAuthComponent implements OnInit {

    composerEvents: any[];
    wsConnection: any;
    
    constructor(
        private userServ: UserService,
        private config: Configuration
    ) {
        // this.translate = translate.getTranslate();
        // this.logger = new LoggerService( this.translate );
        this.composerEvents = [];
    }   

    public ngOnInit() {
        //  sedding the resize event, for AdminLTE to place the height
        let ie = this.detectIE();
        if (!ie) {
            window.dispatchEvent(new Event('resize'));
        } else {
            // solution for IE from @hakonamatata
            let event = document.createEvent('Event');
            event.initEvent('resize', false, true);
            window.dispatchEvent(event);
        }

        this.wsConnection = new WebSocket(this.config.composerEventsURL, ['soap', 'xmpp']);

        this.wsConnection.onopen = function () {
            console.log('WebSocket connected');
            //connection.send('Ping'); // Send the message 'Ping' to the server
        };

        // Log errors
        this.wsConnection.onerror = function (error) {
            console.log('WebSocket Error ' + error);
        };

        var self = this;
        // Log messages from the server
        this.wsConnection.onmessage = function (e) {
            console.log('Server: ' + e.data);
            self.composerEvents.push(JSON.parse(e.data));
        };

    }

    onShowHyperledgerEvents(){
        $("#showComposerEventsModal").modal('show');
    }

    protected detectIE(): any {
        let ua = window.navigator.userAgent;

        // Test values; Uncomment to check result …
        // IE 10
        // ua = 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.2; Trident/6.0)';
        // IE 11
        // ua = 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko';
        // IE 12 / Spartan
        // ua = 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36 Edge/12.0';
        // Edge (IE 12+)
        // ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko)
        // Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586';

        let msie = ua.indexOf('MSIE ');
        if (msie > 0) {
            // IE 10 or older => return version number
            return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
        }

        let trident = ua.indexOf('Trident/');
        if (trident > 0) {
            // IE 11 => return version number
            let rv = ua.indexOf('rv:');
            return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
        }

        let edge = ua.indexOf('Edge/');
        if (edge > 0) {
            // Edge (IE 12+) => return version number
            return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
        }

        // other browser
        return false;
    }

}
