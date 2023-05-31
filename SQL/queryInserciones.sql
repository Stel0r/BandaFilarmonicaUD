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

-- registrar el usuario

insert into registrousuario values('orquestafilarmonicaud2023@gmail.com', 'coordinadorFilarmonica');

-- introducimos el Estado Activo e Inactivo: 

insert into estado values('Activo');
insert into estado values('Inactivo');

-- Periodo 202202

insert into calendario values('REQU','PA',0001,'Inactivo',to_date('24/06/2022 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('30/06/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','CN',0002,'Inactivo',to_date('02/07/2022 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('10/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','SL',0003,'Inactivo',to_date('10/07/2022 12:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('11/07/2022 04:00 PM', 'dd/mm/yyyy HH:MI AM'));

--ensayos

insert into calendario values('REQU','EN',0004,'Inactivo',to_date('12/07/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('12/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0005,'Inactivo',to_date('15/07/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('15/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0006,'Inactivo',to_date('19/07/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('19/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0007,'Inactivo',to_date('22/07/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('22/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0008,'Inactivo',to_date('26/07/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('26/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0009,'Inactivo',to_date('29/07/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('29/07/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0010,'Inactivo',to_date('03/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0011,'Inactivo',to_date('06/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('06/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0012,'Inactivo',to_date('10/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('10/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0013,'Inactivo',to_date('13/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('13/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0014,'Inactivo',to_date('17/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('17/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0015,'Inactivo',to_date('20/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('20/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0016,'Inactivo',to_date('24/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('24/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0017,'Inactivo',to_date('27/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('27/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0018,'Inactivo',to_date('31/08/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('31/08/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','EN',0019,'Inactivo',to_date('03/09/2022 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/09/2022 06:00 PM', 'dd/mm/yyyy HH:MI AM'));

--funciones


insert into calendario values('REQU','FN',0020,'Inactivo',to_date('04/09/2022 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('04/09/2022 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','FN',0021,'Inactivo',to_date('05/09/2022 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('05/09/2022 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('REQU','FN',0022,'Inactivo',to_date('06/09/2022 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('06/09/2022 10:00 AM', 'dd/mm/yyyy HH:MI AM'));

-- Periodo 202301

insert into calendario values('PSSM','PA',0023,'Inactivo',to_date('22/03/2023 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('28/03/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','CN',0024,'Activo',to_date('02/04/2023 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('09/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','SL',0025,'Inactivo',to_date('10/04/2023 12:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('11/04/2023 04:00 PM', 'dd/mm/yyyy HH:MI AM'));

--ensayos

insert into calendario values('PSSM','EN',0026,'Inactivo',to_date('12/04/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('12/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0027,'Inactivo',to_date('15/04/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('15/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0028,'Inactivo',to_date('19/04/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('19/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0029,'Inactivo',to_date('22/04/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('22/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0030,'Inactivo',to_date('26/04/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('26/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0031,'Inactivo',to_date('29/04/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('29/04/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0032,'Inactivo',to_date('03/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0033,'Inactivo',to_date('06/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('06/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0034,'Inactivo',to_date('10/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('10/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0035,'Inactivo',to_date('13/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('13/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0036,'Inactivo',to_date('17/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('17/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0037,'Inactivo',to_date('20/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('20/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0038,'Inactivo',to_date('24/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('24/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0039,'Inactivo',to_date('27/05/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('27/05/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0040,'Activo',to_date('31/05/2023 1:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('31/05/2023 03:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','EN',0041,'Activo',to_date('03/06/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));

--funciones


insert into calendario values('PSSM','FN',0042,'Activo',to_date('04/06/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('04/06/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','FN',0043,'Activo',to_date('05/06/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('05/06/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('PSSM','FN',0044,'Activo',to_date('06/06/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('06/06/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));

-- Periodo 202302

insert into calendario values('MSIM','PA',0045,'Activo',to_date('24/06/2023 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('30/06/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','CN',0046,'Activo',to_date('02/07/2023 06:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('09/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','SL',0047,'Activo',to_date('10/07/2023 12:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('11/07/2023 04:00 PM', 'dd/mm/yyyy HH:MI AM'));

--ensayos

insert into calendario values('MSIM','EN',0048,'Activo',to_date('12/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('12/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0049,'Activo',to_date('15/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('15/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0050,'Activo',to_date('19/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('19/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0051,'Activo',to_date('22/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('22/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0052,'Activo',to_date('26/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('26/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0053,'Activo',to_date('29/07/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('29/07/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0054,'Activo',to_date('03/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0055,'Activo',to_date('06/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('06/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0056,'Activo',to_date('10/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('10/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0057,'Activo',to_date('13/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('13/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0058,'Activo',to_date('17/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('17/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0059,'Activo',to_date('20/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('20/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0060,'Activo',to_date('24/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('24/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0061,'Activo',to_date('27/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('27/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0062,'Activo',to_date('31/08/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('31/08/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','EN',0063,'Activo',to_date('03/09/2023 4:00 PM', 'dd/mm/yyyy HH:MI AM'),to_date('03/09/2023 06:00 PM', 'dd/mm/yyyy HH:MI AM'));

--funciones


insert into calendario values('MSIM','FN',0064,'Activo',to_date('04/09/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('04/09/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','FN',0065,'Activo',to_date('05/09/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('05/09/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));
insert into calendario values('MSIM','FN',0066,'Activo',to_date('06/09/2023 8:00 AM', 'dd/mm/yyyy HH:MI AM'),to_date('06/09/2023 10:00 AM', 'dd/mm/yyyy HH:MI AM'));


-- Registro uso liquidacion

-- 202202

insert into participacionestudiante values(0004,'REQU','EN',0004,'20201020008');
insert into participacionestudiante values(0005,'REQU','EN',0004,'20201020009');
insert into participacionestudiante values(0006,'REQU','EN',0004,'20201020036');
insert into participacionestudiante values(0007,'REQU','EN',0005,'20201020008');
insert into participacionestudiante values(0008,'REQU','EN',0005,'20201020009');
insert into participacionestudiante values(0009,'REQU','EN',0005,'20201020036');
insert into participacionestudiante values(0010,'REQU','EN',0006,'20201020008');
insert into participacionestudiante values(0011,'REQU','EN',0006,'20201020009');
insert into participacionestudiante values(0012,'REQU','EN',0006,'20201020036');

insert into participacionestudiante values(0013,'REQU','EN',0007,'20201020008');
insert into participacionestudiante values(0014,'REQU','EN',0007,'20201020009');
insert into participacionestudiante values(0015,'REQU','EN',0007,'20201020036');
insert into participacionestudiante values(0016,'REQU','EN',0008,'20201020008');
insert into participacionestudiante values(0017,'REQU','EN',0008,'20201020009');
insert into participacionestudiante values(0018,'REQU','EN',0008,'20201020036');
insert into participacionestudiante values(0019,'REQU','EN',0009,'20201020008');
insert into participacionestudiante values(0020,'REQU','EN',0009,'20201020009');
insert into participacionestudiante values(0021,'REQU','EN',0009,'20201020036');

insert into participacionestudiante values(0022,'REQU','EN',0010,'20201020008');
insert into participacionestudiante values(0023,'REQU','EN',0010,'20201020009');

insert into participacionestudiante values(0024,'REQU','EN',0011,'20201020008');
insert into participacionestudiante values(0025,'REQU','EN',0011,'20201020009');

insert into participacionestudiante values(0026,'REQU','EN',0012,'20201020008');
insert into participacionestudiante values(0027,'REQU','EN',0012,'20201020009');

insert into participacionestudiante values(0028,'REQU','EN',0013,'20201020008');
insert into participacionestudiante values(0029,'REQU','EN',0013,'20201020009');

insert into participacionestudiante values(0030,'REQU','EN',0014,'20201020008');
insert into participacionestudiante values(0031,'REQU','EN',0014,'20201020009');

insert into participacionestudiante values(0032,'REQU','EN',0015,'20201020008');
insert into participacionestudiante values(0033,'REQU','EN',0015,'20201020009');

insert into participacionestudiante values(0034,'REQU','EN',0016,'20201020008');
insert into participacionestudiante values(0035,'REQU','EN',0016,'20201020009');

insert into participacionestudiante values(0036,'REQU','EN',0017,'20201020008');
insert into participacionestudiante values(0037,'REQU','EN',0017,'20201020009');

insert into participacionestudiante values(0038,'REQU','EN',0018,'20201020008');
insert into participacionestudiante values(0039,'REQU','EN',0018,'20201020009');

insert into participacionestudiante values(0040,'REQU','EN',0019,'20201020008');
insert into participacionestudiante values(0041,'REQU','EN',0019,'20201020009');

insert into participacionestudiante values(0042,'REQU','FN',0020,'20201020008');
insert into participacionestudiante values(0043,'REQU','FN',0020,'20201020009');
insert into participacionestudiante values(0044,'REQU','FN',0020,'20201020036');
insert into participacionestudiante values(0045,'REQU','FN',0021,'20201020008');
insert into participacionestudiante values(0046,'REQU','FN',0021,'20201020009');
insert into participacionestudiante values(0047,'REQU','FN',0021,'20201020036');
insert into participacionestudiante values(0048,'REQU','FN',0022,'20201020008');
insert into participacionestudiante values(0049,'REQU','FN',0022,'20201020009');
insert into participacionestudiante values(0050,'REQU','FN',0022,'20201020036');

commit;