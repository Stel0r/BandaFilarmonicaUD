import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ListStudentsComponent } from './list-students/list-students.component';
import { InicioPaginaComponent } from './inicio-pagina/inicio-pagina.component';
import { CarrucelComponent } from './inicio-pagina/carrucel/carrucel.component';

@NgModule({
    declarations: [
        AppComponent,
        NavbarComponent,
        ListStudentsComponent,
        InicioPaginaComponent
    ],
    providers: [],
    bootstrap: [AppComponent],
    imports: [
        BrowserModule,
        AppRoutingModule,
        NgbModule,
        CarrucelComponent
    ]
})
export class AppModule { }
