import { Component } from '@angular/core';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {

  nombre:string = "diego"
  usuarioLogeado : boolean = true

  cambiarNombre(){
    this.usuarioLogeado = false
  }
}
