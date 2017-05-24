import { Component, OnInit, Output, Input, EventEmitter } from '@angular/core';

@Component({
  selector: 'char-list',
  templateUrl: './char-list.component.html'
  
})
export class CharListComponent {
    @Input() title:string;
    @Input() isEdit:boolean;

    @Input() items:string[];
    @Input() originalItems:string[];

    @Output() itemAddedEvent = new EventEmitter();
    @Output() itemRemovedEvent = new EventEmitter();

    get listItems():ListItem[]{
        if(this.originalItems == null || this.items == null){
            return null;
        }
        var result = [];
        //check if any of the original items was deleted
        for(var item of this.originalItems){
            if(this.items.indexOf(item) < 0){
                var listItem = new ListItem();
                listItem.isDeleted = true;
                listItem.item = item;

                result.push(listItem);
            }
        }

        //check for new items
        for(var item of this.items){
            if(this.originalItems.indexOf(item) < 0){
                var listItem = new ListItem();
                listItem.isNew = true;
                listItem.item = item;

                result.push(listItem);
            }else{
                var listItem = new ListItem();
                listItem.item = item;

                result.push(listItem);
            }
        }

        return result;
    }

    newItem:string;
    
    constructor(){
           
    }

    ngOnInit() {

    }



    onAddClicked(){
        if(this.newItem == null || this.newItem == ""){
            return;
        }
        this.itemAddedEvent.emit(this.newItem);
        this.newItem = "";
    }

    onRemoveClicked(item){
        this.itemRemovedEvent.emit(this.newItem);
    }
}

class ListItem{
    constructor(){
        this.isDeleted = false;
        this.isNew = false;
    }
    isNew:boolean;
    isDeleted:boolean;
    item:string;
}