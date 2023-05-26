/* Preparar los registros de la tabla calendario (insertarlos en la base durante la 
sustentación) con la obra del semestre 202301 e incluir un registro de 
Planeación, un registro de convocatoria, un registro de selección, 16 registros 
de ensayos (2 horas por día, 2 días a la semana) y 3 de funciones, 1 de 
Reporte Estudiantes, 1 de Liquidación Empleados, 1 de Liquidación Gastos. 
Todos con estado “Activo*/

/*
Tipos de Calendario
('PA','Planeación');
('CN','Convocatoria');
('SL','Seleccion');
('EN','Ensayo');
('FN','Funcion');




Estructura:

    Idobra,id TipoCalendario,IdCalendario (seq),idEstado,fechaInicio, Fechafin (incluir horas en las fechas)

*/

-- introducimos el Estado Activo: 

insert into estado values('Activo')


insert into calendario values('MSIM','PA',0001,'Activo',to_date('02/06/2023 06:00 AM'. 'dd/mm/yyyy HH:MI AM'),to_date('07/06/2023 06:00 PM'. 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','CN',0002,'Activo',to_date('08/06/2023 06:00 AM'. 'dd/mm/yyyy HH:MI AM'),to_date('10/06/2023 06:00 PM'. 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','SL',0002,'Activo',to_date('11/06/2023 12:00 PM'. 'dd/mm/yyyy HH:MI AM'),to_date('11/06/2023 04:00 PM'. 'dd/mm/yyyy HH:MI AM'));

--ensayos

insert into calendario values('MSIM','EN',0002,'Activo',to_date('12/06/2023 4:00 PM'. 'dd/mm/yyyy HH:MI AM'),to_date('12/06/2023 06:00 PM'. 'dd/mm/yyyy HH:MI AM'));




commit;