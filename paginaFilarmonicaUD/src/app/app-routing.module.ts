import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InicioPaginaComponent } from './inicio-pagina/inicio-pagina.component';
import { AppComponent } from './app.component';
import { ListStudentsComponent } from './list-students/list-students.component';
import { FormStudentComponent } from './form-student/form-student.component';
import { AdminComponent } from './admin/admin.component';
import { CalendarioComponent } from './calendario/calendario.component';
import { LiquidacionEstudianteComponent } from './liquidacion-estudiante/liquidacion-estudiante.component';

const routes: Routes = [
  {path:'',component:InicioPaginaComponent},
  {path:'listEstudiantes', component:ListStudentsComponent},
  {path:'formEstudiantes', component:FormStudentComponent},
  {
    path:'Admin', component:AdminComponent,
    children:[
      {path:'Calendario', component:CalendarioComponent},
      {path:'Liquidacion', component:LiquidacionEstudianteComponent}
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  bootstrap: [AppComponent]
})
export class AppRoutingModule { }
