import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent {
  periodo:string = "202301"

  constructor(private router:Router,private route:ActivatedRoute){

  }
  abrirCalendario(){
    console.log("llego")
    this.router.navigate(['Calendario',this.periodo],{relativeTo:this.route})
  }

  cambioPeriodo(){
    this.router.navigate(['Admin'])
  }
}
