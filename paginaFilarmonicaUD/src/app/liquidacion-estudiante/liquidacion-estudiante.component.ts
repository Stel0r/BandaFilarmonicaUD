import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import * as Notiflix from 'notiflix';
import * as pdfMake from "pdfmake/build/pdfmake";
import * as pdfFonts from 'pdfmake/build/vfs_fonts';

(<any>pdfMake).vfs = pdfFonts.pdfMake.vfs;

@Component({
  selector: 'app-liquidacion-estudiante',
  templateUrl: './liquidacion-estudiante.component.html',
  styleUrls: ['./liquidacion-estudiante.component.css']
})
export class LiquidacionEstudianteComponent {
  constructor(private http:HttpClient){}

  crearPDF(){
    const pdfDefinition: any = {
      info: {
        title: 'awesome Document',
        author: 'john doe',
        subject: 'subject of document',
        keywords: 'keywords for document',
        },
      content: [
        {text: 'Liquidación Viáticos Periodo XXXX', style: 'header', fontSize: 25},
        {text: '                                     '},
        {
          layout: 'lightHorizontalLines',
          table: {
            headerRows: 1,
            widths: [ '*', 'auto', 100, '*' ],
    
            body: [
              [ 'Estudiante', 'Codigo', 'Facultad', '# de Horas' ],
              [ 'Diego Gamez', '20201020009', 'Faculdad de Ingenieria', '7' ],
              [ "Harrinson Toledo", '20201020008', 'Facultad de Ingenieria', '5' ]
            ]
          }
        }
      ]
    }
    pdfMake.createPdf(pdfDefinition).open();
  }

  enviarCorreo(){
    Notiflix.Loading.standard('Enviando Correo')

    let parametros = {
      asunto: "Electiva cursada en el grupo SinfonicaUD - periodo XXXX",
      contenidos: "El estudiante Harrinson Toledo curso la electiva participacion sinfonicaUD derate el periodo XXXX",
      remitente: "ironstar2003@gmail.com"
    }

    this.http.post("http://127.0.0.1:8000/enviarCorreo",parametros).subscribe(
      {
        next: res => {
          Notiflix.Loading.remove()
          Notiflix.Notify.success('Email Enviado Correctamente')
        },
        error: err => {
          Notiflix.Loading.remove()
          Notiflix.Notify.warning('No se pudo enviar el Email Correctamente')
        }
      })
  }
}
