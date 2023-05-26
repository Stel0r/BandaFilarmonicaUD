import { Component } from '@angular/core';
import { FormBuilder, FormControl, FormGroup,Validators  } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-form-student',
  templateUrl: './form-student.component.html',
  styleUrls: ['./form-student.component.css']
})
export class FormStudentComponent {


  formulario!: FormGroup;
  constructor(private fb:FormBuilder,private router:Router){}

  ngOnInit(){
    this.crearFormulario()
    this.listaProyectos.set("Ingenieria",["sistemas","mamadas"])
    this.listaProyectos.set("artes",["danzas","microtrafico"])
  }

  proyectoSeleccionado = "ingenieria"
  listaProyectos:Map<string,Array<string>> = new Map()

  enviarFormulario(){
    this.router.navigate([''])
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
      nombre:['',Validators.required],
      apellido:['',Validators.required],
      codigo:['',Validators.required],
      correoP:['',Validators.compose([Validators.required,Validators.email])],
      proyecto:['',Validators.required],
      facultad:['',Validators.required]
    })
  }
}
