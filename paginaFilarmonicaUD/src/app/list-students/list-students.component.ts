import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { estudianteResponse } from '../modelos/responses';

@Component({
  selector: 'app-list-students',
  templateUrl: './list-students.component.html',
  styleUrls: ['./list-students.component.css']
})
export class ListStudentsComponent {

  listaEstudiantes : Array<any>

  constructor(private http:HttpClient){}


  ngOnInit(){
    this.http.get<estudianteResponse>("http://127.0.0.1:8000/lista").subscribe({
      next:(res)=>{
        this.listaEstudiantes = res.data
        console.log(this.listaEstudiantes)
      },
      error: (error) => {
        console.log(error)
      }
    })
  }

}
