import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { estudianteConResponse } from '../modelos/responses';
import * as Notiflix from 'notiflix';

@Component({
  selector: 'app-seleccion-con',
  templateUrl: './seleccion-con.component.html',
  styleUrls: ['./seleccion-con.component.css']
})
export class SeleccionConComponent {
  
  listaEstudianteCon: Array<any>

  constructor(private http:HttpClient){}

  seleccionar(){
    this.http.get<estudianteConResponse>("http://127.0.0.1:8000/listaEstudianteCon").subscribe({
      next:(res)=>{
        this.listaEstudianteCon = res.data
        console.log(this.listaEstudianteCon)
      },
      error: (error) => {
        console.log(error)
      }
    })

    Notiflix.Loading.standard('Registrando Participacion')
    for(let estudiante of this.listaEstudianteCon){
      let data = {
        idobra:estudiante[5],
        conseccalendario:estudiante[9],
        codestudiante:estudiante[2]
      }
      this.http.post("http://127.0.0.1:8000/registrarSeleccion", data).subscribe({
        next: res => {
  
        },
        error: err => {
          Notiflix.Loading.remove()
          Notiflix.Notify.warning('No se pudo registrar correctamente')
        }
      })
    }
    Notiflix.Loading.remove()
    Notiflix.Notify.success("Registro exitoso")
  }
}
