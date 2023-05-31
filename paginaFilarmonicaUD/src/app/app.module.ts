import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ListStudentsComponent } from './list-students/list-students.component';
import { InicioPaginaComponent } from './inicio-pagina/inicio-pagina.component';
import { CarrucelComponent } from './inicio-pagina/carrucel/carrucel.component';
import { FormStudentComponent } from './form-student/form-student.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AdminComponent } from './admin/admin.component';
import { CalendarioComponent } from './calendario/calendario.component';
import { LiquidacionEstudianteComponent } from './liquidacion-estudiante/liquidacion-estudiante.component';
import { SeleccionConComponent } from './seleccion-con/seleccion-con.component';
import { AsistenciaComponent } from './asistencia/asistencia.component';
import { LoginComponent } from './login/login.component';

@NgModule({
    declarations: [
        AppComponent,
        NavbarComponent,
        ListStudentsComponent,
        InicioPaginaComponent,
        FormStudentComponent,
        AdminComponent,
        CalendarioComponent,
        LiquidacionEstudianteComponent,
        SeleccionConComponent,
        AsistenciaComponent,
        LoginComponent
    ],
    providers: [],
    bootstrap: [AppComponent],
    imports: [
        BrowserModule,
        AppRoutingModule,
        NgbModule,
        CarrucelComponent,
        ReactiveFormsModule,
        HttpClientModule,
        FormsModule
    ]
})
export class AppModule { }
