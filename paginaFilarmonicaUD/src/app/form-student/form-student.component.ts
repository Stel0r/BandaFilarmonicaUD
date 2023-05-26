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
