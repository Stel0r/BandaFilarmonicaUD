import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CalendarioService } from '../servicios/calendario.service';
import { Evento } from '../modelos/evento';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent {
  periodo:string = "202301"




  constructor(private router:Router,private route:ActivatedRoute,private calenService:CalendarioService){

  }

  ngOnInit(){
    console.log(this.router.url.split("/"))
    if(this.router.url != "/Admin"){
      this.router.navigate(['Admin'])
    }
    this.calenService.actualizarCalendario(this.periodo)
  }

  abrirCalendario(){
    console.log("llego")
    this.router.navigate(['Calendario',this.periodo],{relativeTo:this.route})
  }

  abrirAsistencia(){
    console.log("llego")
    this.router.navigate(['Asistencia',this.periodo],{relativeTo:this.route})
  }

  cambioPeriodo(){
    this.router.navigate(['Admin'])
    this.calenService.actualizarCalendario(this.periodo)
  }

  habilitarSeleccion(){
    return (this.calenService.estadoPlaneacion() === "Activo" || this.calenService.estadoPlaneacion() === "error" )
  }

  habilitarAsistencia(){
    let ensayoHoy = this.calenService.obtenerEnsayoHoy()
    if(ensayoHoy === undefined){
      return true
    }else return false
  }

  habilitarLiquidacion(){
    console.log(this.calenService.liquidacionValida())
    return !this.calenService.liquidacionValida()
  }
  

  habilitarCalendario(){
    return this.calenService.calendario.length == 0
  }


}
