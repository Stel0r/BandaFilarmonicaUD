import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { estudianteResponse } from '../modelos/responses';
import { ActivatedRoute, Router } from '@angular/router';
import { Evento } from '../modelos/evento';
import { CalendarioService } from '../servicios/calendario.service';

@Component({
  selector: 'app-asistencia',
  templateUrl: './asistencia.component.html',
  styleUrls: ['./asistencia.component.css']
})
export class AsistenciaComponent {
  listaEstudiantes:Array<string>
  periodo:string
  eventoHoy:Evento
  listaAsistencia: Map<string,boolean> = new Map()

  constructor(private http:HttpClient, private route:ActivatedRoute, private calenService:CalendarioService,private router:Router){}

  ngOnInit(){
    this.route.params.subscribe((params) =>{
      if(params['periodo']){
        this.periodo = params['periodo']
      }
    })
    this.http.get<estudianteResponse>("http://127.0.0.1:8000/seleccionados/"+this.periodo).subscribe(
      {
        next:(res) => {
          this.listaEstudiantes = res.data
          for (let e of this.listaEstudiantes){
            this.listaAsistencia.set(e[1],false)
          }
        }
      }
    )
    this.eventoHoy = this.calenService.obtenerEnsayoHoy()
    if(!this.eventoHoy){
      this.router.navigate(['Admin'])
    }
  }


  enviarAsistencia(){
    let data = new Array<any>
    for(let e of this.listaAsistencia.keys()){
      if(this.listaAsistencia.get(e)){
        data.push(e)
      }
    }
    let update = {
      "data":data,
      "event":this.eventoHoy.consecCalen
    }
    this.http.post("http://127.0.0.1:8000/subirAsistencia",update).subscribe()
  }
}


