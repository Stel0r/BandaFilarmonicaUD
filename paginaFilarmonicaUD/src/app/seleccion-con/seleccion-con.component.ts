import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { estudianteConResponse } from '../modelos/responses';

@Component({
  selector: 'app-seleccion-con',
  templateUrl: './seleccion-con.component.html',
  styleUrls: ['./seleccion-con.component.css']
})
export class SeleccionConComponent {
  
  listaEstudianteCon: Array<any>

  constructor(private http:HttpClient){}


  ngOnInit(){
    this.http.get<estudianteConResponse>("http://127.0.0.1:8000/listaEstudianteCon").subscribe({
      next:(res)=>{
        this.listaEstudianteCon = res.data
        console.log(this.listaEstudianteCon)
      },
      error: (error) => {
        console.log(error)
      }
    })
  }
}
