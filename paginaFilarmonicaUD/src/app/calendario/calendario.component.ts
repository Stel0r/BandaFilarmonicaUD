import { Component } from '@angular/core';

@Component({
    selector: 'app-calendario',
    templateUrl: './calendario.component.html',
    styleUrls: ['./calendario.component.css']
})
export class CalendarioComponent {

    periodo:string = "202301"
    mes = new Date().getMonth()
    date:Date
    //estos arrays es para que ngFor pueda recorrerlos
    dias : Array<number>
    diaInicial : Array<number>
    diasFinales: Array<number>
    diaSeleccionado: HTMLDivElement

    
    ngOnInit(){
        this.date = new Date()
        this.date.setMonth(this.mes)
        var firstDay = new Date(this.date.getFullYear(), this.date.getMonth(), 1);
        var lastDay = new Date(this.date.getFullYear(), this.date.getMonth() + 1, 0);
        this.dias = Array(lastDay.getDate()).fill(0).map((x,i)=> i+1)
        this.diaInicial = Array(firstDay.getDay()).fill(0).map((x,i)=> i+1)
        this.diasFinales = Array(6-lastDay.getDay()).fill(0).map((x,i)=> i+1)
    }

    ngAfterViewInit(){
        let diaHoy = document.getElementById(new Date().getDate().toString())!
        diaHoy.classList.add("dia-num-hoy")
    }

    seleccionarDia(dia:number){
        let diaClick = document.getElementById("contenedor"+dia)!
        diaClick.classList.add("dia-select")
        if(this.diaSeleccionado && diaClick.id != this.diaSeleccionado.id){
            this.diaSeleccionado.classList.remove("dia-select")
        }
        this.diaSeleccionado = diaClick as HTMLDivElement
}
}