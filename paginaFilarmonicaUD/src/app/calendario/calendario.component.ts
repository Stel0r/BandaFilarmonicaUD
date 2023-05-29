import { Component } from '@angular/core';
import { estudianteResponse } from '../modelos/responses';
import { HttpClient } from '@angular/common/http';
import { Evento } from '../modelos/evento'
import { ActivatedRoute } from '@angular/router';
import { toInteger } from '@ng-bootstrap/ng-bootstrap/util/util';

@Component({
    selector: 'app-calendario',
    templateUrl: './calendario.component.html',
    styleUrls: ['./calendario.component.css']
})

export class CalendarioComponent {

    coloresEventos:any = [
        ['Planeacion',"#E7F964"],
        ['Convocatoria',"#ACFF5D"],
        ['Seleccion',"#5DCEFF"],
        ['Ensayo',"#FF5050"],
        ['Funcion',"#7D50FF"],
    ]

    periodo:string
    año: number
    mes = new Date().getMonth()
    date: Date
    //estos arrays es para que ngFor pueda recorrerlos
    dias: Array<number>
    coloresEvento:Map<string,string> = new Map(this.coloresEventos)
    diaInicial: Array<number>
    diasFinales: Array<number>
    diaFinal:number
    diaSeleccionado: HTMLDivElement
    hayDiaSeleccionado: boolean = false
    numDia: number = 0
    eventos: Map<string,Array<Evento>> = new Map()

    constructor(private http: HttpClient,private ruta :ActivatedRoute) { }


    ngOnInit() {
        this.ruta.params.subscribe((params) => {
            if(params['periodo']){
                this.periodo = params['periodo']
                this.año = parseInt(this.periodo.substring(0,4))
            }
        })
        console.log(this.mes)
        this.date = new Date(this.año, this.mes)
        this.date.setMonth(this.mes)
        this.date.setFullYear(this.año)
        var firstDay = new Date(this.date.getFullYear(), this.date.getMonth(), 1);
        var lastDay = new Date(this.date.getFullYear(), this.date.getMonth() + 1, 0);
        this.diaFinal = lastDay.getDate()
        this.dias = Array(lastDay.getDate()).fill(0).map((x, i) => i + 1)
        this.diaInicial = Array(firstDay.getDay()).fill(0).map((x, i) => i + 1)
        this.diasFinales = Array(6 - lastDay.getDay()).fill(0).map((x, i) => i + 1)
    }

    ngAfterViewInit() {
        this.traerDatosMes()
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
        if (this.mes != this.date.getMonth() || this.año != this.date.getFullYear()) {
            this.traerDatosMes()
            if(this.diaSeleccionado){
                this.diaSeleccionado.classList.remove("dia-select")
                this.diaSeleccionado = null
                this.hayDiaSeleccionado = false
                this.numDia = 0
            }
            this.date = new Date(this.año, this.mes)
            this.date.setMonth(this.mes)
            this.date.setFullYear(this.año)
            var firstDay = new Date(this.date.getFullYear(), this.date.getMonth(), 1);
            var lastDay = new Date(this.date.getFullYear(), this.date.getMonth() + 1, 0);
            this.diaFinal = lastDay.getDate()
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
        console.log(diaLista)
        let fecha = new Date(parseInt(diaLista[0]),parseInt(diaLista[1])-1,parseInt(diaLista[2]),parseInt(horaLista[0]),parseInt(horaLista[1]))
        console.log(fecha)
        return fecha
    }

    traerDatosMes() {
        this.eventos.clear()
        let mesNumero:any = this.mes
        this.http.get<estudianteResponse>("http://127.0.0.1:8000/obtenerCalendario/"+this.periodo+"-"+(parseInt(mesNumero)+1)).subscribe({
            next: (res) => {
                if(res.data.length != 0){
                    for (let e of res.data){
                        console.log(e)
                        let evento = new Evento()
                        evento.nombreObra = e[0]
                        evento.tipoEvento = e[1]
                        evento.estado = e[2]
                        evento.fechaI = this.crearFecha(e[3].toString())
                        evento.fechaF = this.crearFecha(e[4].toString())
                        evento.consecCalen = e[5]
                        console.log(evento)
                        let dia = evento.fechaI.getDate();
                        let fechafinal:number
                        if(this.mes != evento.fechaF.getMonth()){
                            fechafinal = this.diaFinal
                        }else{
                            fechafinal = evento.fechaF.getDate()
                        }
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

    formatearMinutos(min:number){
        if (min<10){
            return "0"+min
        }else{
            return min
        }
    }

    reiniciarMapa(){
        for(let i;i<=this.diasFinales.length;i++){
            this.eventos.set(i,[])
        }
    }


    inactivarPlaneacion(periodo:string){
        let body = {
            periodo:periodo,
            actividad:"PA"
        }
        this.http.post("http://127.0.0.1:8000/inactivarAct",body).subscribe()
    }

}
