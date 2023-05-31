import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import * as Notiflix from 'notiflix';
import * as pdfMake from "pdfmake/build/pdfmake";
import * as pdfFonts from 'pdfmake/build/vfs_fonts';
import { liquidacionResponse } from '../modelos/responses';

(<any>pdfMake).vfs = pdfFonts.pdfMake.vfs;

@Component({
  selector: 'app-liquidacion-estudiante',
  templateUrl: './liquidacion-estudiante.component.html',
  styleUrls: ['./liquidacion-estudiante.component.css']
})
export class LiquidacionEstudianteComponent {
  listaLiquidacion : Array<any>
  periodo : string
  horas : number = 38

  pdfLista : Array<any> = [[ 'Estudiante', 'Codigo', 'Facultad', '# de Horas' ]]

  constructor(private http:HttpClient){}

  ngOnInit(){
    this.http.get<liquidacionResponse>("http://127.0.0.1:8000/periodoInactivo").subscribe({
      next:(res)=>{
        for(let e of res.data){
          this.periodo = "" + e[0]
        }
        this.cargarLiquidacion(this.periodo)
        console.log(this.periodo)
      },
      error: (error) => {
        console.log(error)
      }
    })
  }

  cargarLiquidacion(periodo:string){
    this.http.get<liquidacionResponse>("http://127.0.0.1:8000/listaLiquidacion/" + periodo).subscribe({
      next:(res)=>{
        this.listaLiquidacion = res.data

        for(let estudiante of res.data){
          this.pdfLista.push([estudiante[0],estudiante[1],estudiante[2],estudiante[4]])
        }

        console.log(this.listaLiquidacion)
      },
      error: (error) => {
        console.log(error)
      }
    })
  }

  crearPDF(){
    const pdfDefinition: any = {
      info: {
        title: 'awesome Document',
        author: 'john doe',
        subject: 'subject of document',
        keywords: 'keywords for document',
        },
      content: [
        {text: 'Liquidación Viáticos Periodo ' + this.periodo, style: 'header', fontSize: 25},
        {text: '                                     '},
        {
          layout: 'lightHorizontalLines',
          table: {
            headerRows: 1,
            widths: [ '*', 'auto', 100, '*' ],
    
            body: this.pdfLista
          }
        }
      ]
    }
    pdfMake.createPdf(pdfDefinition).open();
  }

  enviarCorreo(){
    Notiflix.Loading.standard('Enviando Correo')

    for(let estudiante of this.listaLiquidacion){
      if(estudiante[4] >= this.horas){
        let parametros = {
          asunto: "Electiva cursada en el grupo SinfonicaUD - periodo " + this.periodo,
          contenidos: "El estudiante " + estudiante[0] + " curso la electiva participacion sinfonicaUD durante el periodo " + this.periodo,
          remitente: estudiante[3]
        }
        this.http.post("http://127.0.0.1:8000/enviarCorreo",parametros).subscribe(
        {
          next: res => {
            Notiflix.Notify.success('Email Enviado Correctamente a: ' + estudiante[0])
          },
          error: err => {
            Notiflix.Loading.remove()
            Notiflix.Notify.warning('No se pudo enviar el Email Correctamente')
          }
        })
      }
    }
    Notiflix.Loading.remove()
    Notiflix.Notify.success("Envio exitoso")
  }
}
