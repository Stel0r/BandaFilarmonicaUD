import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup,Validators  } from '@angular/forms';
import { Router } from '@angular/router';
import { unidadesResponse } from '../modelos/responses';

@Component({
  selector: 'app-form-student',
  templateUrl: './form-student.component.html',
  styleUrls: ['./form-student.component.css']
})
export class FormStudentComponent {


  formulario!: FormGroup;
  listaUnidades : Map<string,Array<string>> = new Map()
  codigos: Map<string,string> = new Map()
  proyectoSeleccionado = "ingenieria"
  hayError:boolean = false;
  mensajeError:string;

  constructor(private fb:FormBuilder,private router:Router, private http:HttpClient){}

  ngOnInit(){

    this.crearFormulario()

    this.http.get<unidadesResponse>("http://127.0.0.1:8000/listaUnidades").subscribe({
      next:(res)=>{
        for(let unidad of res.data){
          if(!this.listaUnidades.has(unidad[0]) && unidad[0] != ""){
            this.listaUnidades.set(unidad[0],[unidad[1]])
          } else {
            this.listaUnidades.get(unidad[0])?.push(unidad[1])
          }
          this.codigos.set(unidad[1],unidad[2])
        }
      },
      error: (error) => {
        console.log(error)
      }
    })
  }

  mostrarError(mensaje:string){
    this.hayError = true
    this.mensajeError = mensaje
  }

  enviarFormulario(){
    console.log(this.formulario.value)
    this.hayError = false

    this.http.post("http://127.0.0.1:8000/agregarEstudiantes",this.formulario.value).subscribe(
      {
        next: res => this.mostrarError("Envio exitoso!!!!"),
        error: err => this.mostrarError("Error al enviar el formulario")
      })
  }

  /**
   * this.http.post("http://127.0.0.1:8000/validate",this.formulario.value).subscribe(
      {
        next: res => this.completarLogIn(res.codigo,res.message),
        error: err => this.completarLogIn(404,"Hubo un Error con el servidor, Intentalo nuevamente")
      })
   */

  arroz(){
    let select = document.getElementById("select") as HTMLSelectElement
    console.log(select.value)
    this.proyectoSeleccionado = select.value
  }

  crearFormulario(){
    this.formulario = this.fb.group({
      codigo:['',Validators.required],
      proyecto:['',Validators.required],
      nombre:['',Validators.required],
      apellido:['',Validators.required],
      fInscripcion:['',Validators.required],
      fNacimiento:['',Validators.required],
      correoP:['',Validators.compose([Validators.required,Validators.email])]
    })
  }
}
