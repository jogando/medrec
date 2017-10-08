import { Component, OnInit, Output, Input, EventEmitter } from '@angular/core';
import { MedicationRecord } from '../../../models/composer';

@Component({
  selector: 'add-medication-record',
  templateUrl: './add-medication-record.component.html'

})
export class AddMedicationRecordComponent {
  @Output() itemAddedEvent = new EventEmitter();

  newItem: MedicationRecord;

  constructor() {
    this.newItem = new MedicationRecord();
  }

  ngOnInit() {

  }

  onOkClicked() {
    this.itemAddedEvent.emit(this.newItem);
    
  }
}


