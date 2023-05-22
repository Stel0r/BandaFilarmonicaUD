import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { ListStudentsComponent } from './list-students/list-students.component';
import { InicioPaginaComponent } from './inicio-pagina/inicio-pagina.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    ListStudentsComponent,
    InicioPaginaComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
