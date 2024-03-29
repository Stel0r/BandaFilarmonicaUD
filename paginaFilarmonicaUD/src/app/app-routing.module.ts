import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InicioPaginaComponent } from './inicio-pagina/inicio-pagina.component';
import { AppComponent } from './app.component';
import { ListStudentsComponent } from './list-students/list-students.component';
import { FormStudentComponent } from './form-student/form-student.component';
import { AdminComponent } from './admin/admin.component';
import { CalendarioComponent } from './calendario/calendario.component';
import { LiquidacionEstudianteComponent } from './liquidacion-estudiante/liquidacion-estudiante.component';
import { SeleccionConComponent } from './seleccion-con/seleccion-con.component';
import { AsistenciaComponent } from './asistencia/asistencia.component';
import { LoginComponent } from './login/login.component';

const routes: Routes = [
  {path:'',component:InicioPaginaComponent},
  {path:'listEstudiantes', component:ListStudentsComponent},
  {path:'formEstudiantes', component:FormStudentComponent},
  {path:'login', component:LoginComponent},
  {
    path:'Admin', component:AdminComponent,
    children:[
      {path:'Calendario/:periodo', component:CalendarioComponent},
      {path:'Liquidacion', component:LiquidacionEstudianteComponent},
      {path:'Seleccion', component:SeleccionConComponent},
      {path:'Asistencia/:periodo', component:AsistenciaComponent}
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  bootstrap: [AppComponent]
})
export class AppRoutingModule { }
