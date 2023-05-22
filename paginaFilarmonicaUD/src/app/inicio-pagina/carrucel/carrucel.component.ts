import { Component } from '@angular/core';
import { NgbCarouselModule } from '@ng-bootstrap/ng-bootstrap';
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-carrucel',
  standalone: true,
  imports: [NgbCarouselModule, NgIf],
  templateUrl: './carrucel.component.html',
  styleUrls: ['./carrucel.component.css']
})
export class CarrucelComponent {
  images = ["presentacion.png", "ImgConvocatoria.png", "ImgInstrumental.png", "ImgAdmin.png"].map((n) => `assets/ImgInicio/${n}`);
}
