import { Component } from '@angular/core';
import { estudianteResponse } from '../modelos/responses';
import { HttpClient } from '@angular/common/http';
import { Evento } from '../modelos/evento'

@Component({
    selector: 'app-calendario',
    templateUrl: './calendario.component.html',
    styleUrls: ['./calendario.component.css']
})

export class CalendarioComponent {

    coloresEventos:any = [
        ['Planeacion',"#FF71C9"],
        ['Convocatoria',"#ACFF5D"],
        ['Seleccion',"#5DCEFF"],
        ['Ensayo',"#FF5050"],
        ['Funcion',"#7D50FF"],
    ]

    periodo: number = new Date().getFullYear()
    mes = new Date().getMonth()
    date: Date
    //estos arrays es para que ngFor pueda recorrerlos
    dias: Array<number>
    coloresEvento:Map<string,string> = new Map(this.coloresEventos)
    diaInicial: Array<number>
    diasFinales: Array<number>
    diaSeleccionado: HTMLDivElement
    hayDiaSeleccionado: boolean = false
    numDia: number = 0
    nombreObra:string;
    eventos: Map<string,Array<Evento>> = new Map()

    constructor(private http: HttpClient) { }


    ngOnInit() {
        console.log(this.mes)
        this.date = new Date(this.periodo, this.mes)
        this.date.setMonth(this.mes)
        this.date.setFullYear(this.periodo)
        var firstDay = new Date(this.date.getFullYear(), this.date.getMonth(), 1);
        var lastDay = new Date(this.date.getFullYear(), this.date.getMonth() + 1, 0);
        this.dias = Array(lastDay.getDate()).fill(0).map((x, i) => i + 1)
        this.diaInicial = Array(firstDay.getDay()).fill(0).map((x, i) => i + 1)
        this.diasFinales = Array(6 - lastDay.getDay()).fill(0).map((x, i) => i + 1)
    }

    ngAfterViewInit() {
        this.traerDatosMes(this.mes)
        let diaHoy = document.getElementById(new Date().getDate().toString())!
        diaHoy.classList.add("dia-num-hoy")
    }

    seleccionarDia(dia: number) {
        let diaClick = document.getElementById("contenedor" + dia)!
        diaClick.classList.add("dia-select")
        if (this.diaSeleccionado) {
            this.diaSeleccionado.classList.remove("dia-select")
            if (diaClick.id == this.diaSeleccionado.id) {
                this.diaSeleccionado = null
                this.hayDiaSeleccionado = false
                this.numDia = 0
            } else {
                this.hayDiaSeleccionado = true
                this.diaSeleccionado = diaClick as HTMLDivElement
                this.numDia = dia
            }
        } else {
            this.hayDiaSeleccionado = true
            this.diaSeleccionado = diaClick as HTMLDivElement
            this.numDia = dia
        }
    }

    cambioMes() {
        if (this.mes != this.date.getMonth()) {
            this.traerDatosMes(this.mes)
            this.date = new Date(this.periodo, this.mes)
            this.date.setMonth(this.mes)
            this.date.setFullYear(this.periodo)
            var firstDay = new Date(this.date.getFullYear(), this.date.getMonth(), 1);
            var lastDay = new Date(this.date.getFullYear(), this.date.getMonth() + 1, 0);
            this.dias = Array(lastDay.getDate()).fill(0).map((x, i) => i + 1)
            this.diaInicial = Array(firstDay.getDay()).fill(0).map((x, i) => i + 1)
            this.diasFinales = Array(6 - lastDay.getDay()).fill(0).map((x, i) => i + 1)
            if (this.mes == new Date().getMonth()) {
                let diaHoy = document.getElementById(new Date().getDate().toString())!
                diaHoy.classList.add("dia-num-hoy")
            } else {
                let diaHoy = document.getElementById(new Date().getDate().toString())
                if (diaHoy) {
                    diaHoy.classList.remove("dia-num-hoy")
                }
            }
        }
    }

    crearFecha(fechaS:string){
        let fechaSeparada = fechaS.split("T")
        let diaLista = fechaSeparada[0].split("-")
        let horaLista = fechaSeparada[1].split(":")
        return new Date(parseInt(diaLista[0]),parseInt(diaLista[1]),parseInt(diaLista[2]),parseInt(horaLista[0]),parseInt(horaLista[1]))
    }

    traerDatosMes(mes) {
        let mesNumero:any = this.mes
        this.http.get<estudianteResponse>("http://127.0.0.1:8000/obtenerCalendario/"+this.periodo+"-"+(parseInt(mesNumero)+1)).subscribe({
            next: (res) => {
                this.eventos.clear()
                if(res.data.length != 0){
                    this.nombreObra = res.data[0][0]
                    for (let e of res.data){
                        let evento = new Evento()
                        evento.tipoEvento = e[1]
                        evento.estado = e[2]
                        evento.fechaI = this.crearFecha(e[3].toString())
                        evento.fechaF = this.crearFecha(e[4].toString())
                        let dia = evento.fechaI.getDate()
                        //se agrega a la lista de eventos del mes
                        for(let i = evento.fechaF.getDate() - dia;i>=0;i--){
                            if(this.eventos.has((dia+i).toString())){
                                this.eventos.get((dia+i).toString()).push(evento)
                            }else{
                                this.eventos.set((dia+i).toString(),[evento])
                            }
                        }
                        
                    }
                }
                
            },
            error: (error) => {
                console.log(error)
            }
        })
    }

    reiniciarMapa(){
        for(let i;i<=this.diasFinales.length;i++){
            this.eventos.set(i,[])
        }
    }
}
