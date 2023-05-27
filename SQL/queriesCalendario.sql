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

insert into estado values('Activo');


insert into calendario values('MSIM','PA',0001,'Activo',to_date('02/06/2023 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('07/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','CN',0002,'Activo',to_date('08/06/2023 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('10/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','SL',0003,'Activo',to_date('11/06/2023 12:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('11/06/2023 04:00 PM', 'dd/mm/yyyy HH:MI AM'));

--ensayos

insert into calendario values('MSIM','EN',0004,'Activo',to_date('12/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('12/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0005,'Activo',to_date('15/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('15/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0006,'Activo',to_date('19/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('19/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0007,'Activo',to_date('22/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('22/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0008,'Activo',to_date('26/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('26/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0009,'Activo',to_date('29/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('29/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0010,'Activo',to_date('03/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0011,'Activo',to_date('06/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('06/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0012,'Activo',to_date('10/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('10/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0013,'Activo',to_date('13/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('13/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0014,'Activo',to_date('17/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('17/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0015,'Activo',to_date('20/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('20/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0016,'Activo',to_date('24/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('24/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0017,'Activo',to_date('27/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('27/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0018,'Activo',to_date('31/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('31/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0019,'Activo',to_date('03/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));

--funciones


insert into calendario values('MSIM','FN',0020,'Activo',to_date('04/08/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('04/08/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','FN',0021,'Activo',to_date('05/08/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('05/08/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','FN',0022,'Activo',to_date('06/08/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('06/08/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));


commit;