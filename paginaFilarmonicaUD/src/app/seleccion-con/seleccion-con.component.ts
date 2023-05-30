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
    Notiflix.Loading.standard('Selecccionando y Registrando')

    this.http.get<estudianteConResponse>("http://127.0.0.1:8000/listaEstudianteCon").subscribe({
      next:(res)=>{
        this.listaEstudianteCon = res.data
        this.registrar()
        this.inactivar()
      },
      error: (error) => {
        Notiflix.Loading.remove()
        Notiflix.Notify.warning('No se pudo cargar los seleccionados correctamente')
      }
    })

    Notiflix.Loading.remove()
    Notiflix.Notify.success("Proceso exitoso")
  }

  registrar(){
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
  }

  inactivar() {
    let inactivar = {
      conseccalendario: this.listaEstudianteCon[0][9] - 1
    }

    this.http.post("http://127.0.0.1:8000/inactivarCalendario", inactivar).subscribe({
      next: res => {
        
      },
      error: err => {
        Notiflix.Loading.remove()
        Notiflix.Notify.warning('Error en el cambio de estado')
      }
    })
  }
}
