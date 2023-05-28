import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SeleccionConComponent } from './seleccion-con.component';

describe('SeleccionConComponent', () => {
  let component: SeleccionConComponent;
  let fixture: ComponentFixture<SeleccionConComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SeleccionConComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SeleccionConComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
