import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { InicioPaginaComponent } from './inicio-pagina/inicio-pagina.component';
import { AppComponent } from './app.component';
import { ListStudentsComponent } from './list-students/list-students.component';
import { FormStudentComponent } from './form-student/form-student.component';

const routes: Routes = [
  {
    path:'',component:InicioPaginaComponent
  },
  {
    path:'listEstudiantes', component:ListStudentsComponent
  },
  {
    path:'formEstudiantes', component:FormStudentComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
  bootstrap: [AppComponent]
})
export class AppRoutingModule { }
