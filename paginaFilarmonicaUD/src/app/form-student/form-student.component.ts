import { Component } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-form-student',
  templateUrl: './form-student.component.html',
  styleUrls: ['./form-student.component.css']
})
export class FormStudentComponent {
  StudentForm = new FormGroup({
    nombres: new FormControl(''),
    apellidos: new FormControl('')
  });
  onSubmit(){
    console.warn(this.StudentForm.value)
  }
}
