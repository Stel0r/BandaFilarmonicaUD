import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LiquidacionEstudianteComponent } from './liquidacion-estudiante.component';

describe('LiquidacionEstudianteComponent', () => {
  let component: LiquidacionEstudianteComponent;
  let fixture: ComponentFixture<LiquidacionEstudianteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LiquidacionEstudianteComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LiquidacionEstudianteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
