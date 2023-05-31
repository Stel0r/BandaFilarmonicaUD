--1.2. Los Generos: 1 Musica Culta; 2 Musica Folclorica; 3 Musica Popular
Insert into generoobra values('MC','Musica Culta');
Insert into generoobra values('MF','Musica Folclorica');
Insert into generoobra values('MP','Musica Popular');


--1.5. Incluir 3 periodos, que equivale al año y el semestre asi (202202, 202301, etc)
insert into periodo values(202302);
insert into periodo values(202301);
insert into periodo values(202202);
insert into periodo values(202201);
insert into periodo values(202102);


--1.3. 5 obras reales con su compositor y pais de donde se le considera la procedencia
insert into pais values('DEU','Alemania');
insert into pais values('AUT','Austria');

insert into compositor values('BAC','DEU','Bach');
insert into compositor values('MOZ','AUT','Mozart');
insert into compositor values('HAN','DEU','Handel');
insert into compositor values('BRA','DEU','Brahms');

insert into obra values('MSIM','MC','DEU',202302,'BAC',to_date('27/07/1733','DD/MM/YYYY'),'Misa en si menor',1);
insert into obra values('PSSM','MC','DEU',202301,'BAC',to_date('15/04/1729','DD/MM/YYYY'),'Pasion de segun San Mateo',0);
insert into obra values('REQU','MC','AUT',202202,'MOZ',to_date('02/01/1793','DD/MM/YYYY'),'Requiem',0);
insert into obra values('MESI','MC','DEU',202201,'HAN',to_date('13/04/1742','DD/MM/YYYY'),'Mesias',0);
insert into obra values('REAL','MC','DEU',202102,'BRA',to_date('10/04/1868','DD/MM/YYYY'),'Un Requiem Aleman',0);

--1.4. Incluir 6 instrumentos reales de cada obra. Tener en cuenta que 2 instrumentos son repetidos. Por ejemplo, 2 registro de violin.
insert into instrumento values('CANT','Cantantes');
insert into instrumento values('VIOL','Violin');
insert into instrumento values('VIOA','Viola');
insert into instrumento values('CHEL','Chelo');
insert into instrumento values('OBOE','Oboe');
insert into instrumento values('FLAU','Flauta');
insert into instrumento values('ORGA','Organo');
insert into instrumento values('BAJO','Bajo');

--Misa en SI menor
insert into relationship_26 values('VIOL','MSIM',1);
insert into relationship_26 values('VIOL','MSIM',2);
insert into relationship_26 values('CANT','MSIM',1);
insert into relationship_26 values('FLAU','MSIM',1);
insert into relationship_26 values('BAJO','MSIM',1);
insert into relationship_26 values('VIOA','MSIM',1);

--Pasion de Segun San Mateo
insert into relationship_26 values('FLAU','PSSM',1);
insert into relationship_26 values('FLAU','PSSM',2);
insert into relationship_26 values('OBOE','PSSM',1);
insert into relationship_26 values('OBOE','PSSM',2);
insert into relationship_26 values('BAJO','PSSM',1);
insert into relationship_26 values('VIOL','PSSM',1);

--Requiem
insert into relationship_26 values('CHEL','REQU',1);
insert into relationship_26 values('BAJO','REQU',1);
insert into relationship_26 values('VIOL','REQU',1);
insert into relationship_26 values('VIOL','REQU',2);
insert into relationship_26 values('ORGA','REQU',1);
insert into relationship_26 values('FLAU','REQU',1); 

--1.6. Incluir la lista de actividades definidas por la UD: 1 Direccion musical 150000, 2 Evaluador musical 80000, 3 Coordinador sinfonica 100000, 4 auxiliar general 25000, auxiliar instrumentos 45000.
insert into listaactividadUD values(202301,'EVAMU','Evaluador Musical',80.00,8);
insert into listaactividadUD values(202301,'DIRMU','Direccion Musical',15.00,8);
insert into listaactividadUD values(202301,'COOSI','Coordinador Sinfornica',10.00,8);
insert into listaactividadUD values(202301,'AUXGE','Auxiliar General',25.00,8);
insert into listaactividadUD values(202301,'AUXIN','Auxiliar Instrumentos',45.00,8);

--1.7. Incluir el tipo de Calendario con: 1 Planeacion; 2 Convocatoria; 3 Seleccion; 4 Ensayo; 5 Funcion
insert into tipocalendario values('PA','Planeacion');
insert into tipocalendario values('CN','Convocatoria');
insert into tipocalendario values('SL','Seleccion');
insert into tipocalendario values('EN','Ensayo');
insert into tipocalendario values('FN','Funcion');

--1.8. Incluir 10 unidades de las cuales 8 son academicas y 2 administrativas. Ejemplo, Si se incluye un proyecto curricular, deben incluir toda su dependencia (Rectoria, vicerrectoria, Facultad, proyecto)
insert into tipounidad values('AD','Adm');
insert into tipounidad values('AC','Aca');

--creacion unidades
insert into unidad values('RECTO','AD',null,'Rectoria');
insert into unidad values('VICRE','AD','RECTO','Vicerrectoria Academica');
insert into unidad values('FACIN','AC','VICRE','Facultad de Ingenieria');
insert into unidad values('INGSI','AC','FACIN','Ingenieria de Sistemas');
insert into unidad values('INGEL','AC','FACIN','Ingenieria Electronica');
insert into unidad values('INGCA','AC','FACIN','Ingenieria Catastral');
insert into unidad values('FACAR','AC','VICRE','Facultad de Artes');
insert into unidad values('ARTDA','AC','FACAR','Arte Danzario');
insert into unidad values('ARTMU','AC','FACAR','Artes Musicales');
insert into unidad values('ARTES','AC','FACAR','Artes Escenicas');
--1.9. Incluir 15 estudiantes inscritos, de los cuales 10 participan en la convocatoria del periodo actual (202301) y 8 obtuvieron calificacion superior a 4.2. Tenga en cuenta que solo pueden participar en la convocatoria los instrumentos relacionados con la obra.

--ingresamos los estudiantes 
insert into estudiante values('20201020009','INGSI','Diego','Gamez',to_date('15/05/2020','dd/mm/yyyy'),to_date('10/11/2002','dd/mm/yyyy'),'diego.felipe.gamez@gmail.com');
insert into estudiante values('20201020036', 'INGSI', 'Juan', 'Vanegas', to_date('15/05/2020','dd/mm/yyyy'), to_date('10/01/2000','dd/mm/yyyy'), 'juanesvanegas1102@gmail.com');
insert into estudiante values('20201020008', 'INGSI', 'Harrinson', 'Toledo', to_date('20/09/2020','dd/mm/yyyy'), to_date('25/07/1999','dd/mm/yyyy'), 'ironstar2003@gmail.com');
insert into estudiante values('20220303003', 'INGSI', 'Andres', 'Lopez', to_date('14/08/2022','dd/mm/yyyy'), to_date('05/03/2001','dd/mm/yyyy'), 'andres.lopez@gmail.com');
insert into estudiante values('20210404004', 'INGSI', 'Laura', 'Martinez', to_date('02/07/2021','dd/mm/yyyy'), to_date('18/11/1998','dd/mm/yyyy'), 'laura.martinez@gmail.com');
insert into estudiante values('20200505005', 'ARTES', 'Carlos', 'Rodriguez', to_date('30/06/2020','dd/mm/yyyy'), to_date('23/09/2000','dd/mm/yyyy'), 'carlos.rodriguez@gmail.com');
insert into estudiante values('20220606006', 'ARTDA', 'Ana', 'Hernandez', to_date('05/03/2022','dd/mm/yyyy'), to_date('15/02/1997','dd/mm/yyyy'), 'ana.hernandez@gmail.com');
insert into estudiante values('20210707007', 'ARTDA', 'Pedro', 'Sanchez', to_date('25/12/2021','dd/mm/yyyy'), to_date('08/06/1996','dd/mm/yyyy'), 'pedro.sanchez@gmail.com');
insert into estudiante values('20200808008', 'ARTMU', 'Sofia', 'Ramirez', to_date('11/09/2020','dd/mm/yyyy'), to_date('29/04/1995','dd/mm/yyyy'), 'sofia.ramirez@gmail.com');
insert into estudiante values('20220909009', 'INGCA', 'Luis', 'Torres', to_date('19/11/2022','dd/mm/yyyy'), to_date('10/07/1994','dd/mm/yyyy'), 'luis.torres@gmail.com');
insert into estudiante values('20221010010', 'ARTES', 'Ana', 'Gomez', to_date('28/03/2022','dd/mm/yyyy'), to_date('12/09/1997','dd/mm/yyyy'), 'ana.gomez@gmail.com');
insert into estudiante values('20211211011', 'INGSI', 'Juan', 'Herrera', to_date('03/08/2021','dd/mm/yyyy'), to_date('25/11/1996','dd/mm/yyyy'), 'juan.herrera@gmail.com');
insert into estudiante values('20201312012', 'ARTES', 'Maria', 'Lopez', to_date('10/05/2020','dd/mm/yyyy'), to_date('20/02/1998','dd/mm/yyyy'), 'maria.lopez@gmail.com');
insert into estudiante values('20221413013', 'ARTMU', 'Pedro', 'Garcia', to_date('07/11/2022','dd/mm/yyyy'), to_date('15/07/1995','dd/mm/yyyy'), 'pedro.garcia@gmail.com');
insert into estudiante values('20201514014', 'ARTDA', 'Laura', 'Martinez', to_date('19/09/2020','dd/mm/yyyy'), to_date('10/04/1994','dd/mm/yyyy'), 'laura.martinez@gmail.com');

--creamos la convocatoria
insert into convocatoriaestudiante values('PSSM', 001,'20201020009','VIOL',to_date('02/04/2023','dd/mm/yyyy'),to_date('09/04/2023','dd/mm/yyyy'),4.4);
insert into convocatoriaestudiante values('PSSM', 002,'20201020036','VIOL',to_date('02/04/2023','dd/mm/yyyy'),to_date('09/04/2023','dd/mm/yyyy'),4.8);
insert into convocatoriaestudiante values('PSSM', 003,'20201020008','OBOE',to_date('02/04/2023','dd/mm/yyyy'),to_date('09/04/2023','dd/mm/yyyy'),4.5);
insert into convocatoriaestudiante values('PSSM', 004, '20221413013', 'VIOL', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 2);
insert into convocatoriaestudiante values('PSSM', 005, '20220909009', 'FLAU', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 4.5);
insert into convocatoriaestudiante values('PSSM', 006, '20211211011', 'FLAU', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 4.6);
insert into convocatoriaestudiante values('PSSM', 007, '20210404004', 'BAJO', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 4.7);
insert into convocatoriaestudiante values('PSSM', 008, '20200505005', 'OBOE', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 1);
insert into convocatoriaestudiante values('PSSM', 009, '20220606006', 'BAJO', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 4.4);
insert into convocatoriaestudiante values('PSSM', 010, '20210707007', 'FLAU', to_date('02/04/2023','dd/mm/yyyy'), to_date('09/04/2023','dd/mm/yyyy'), 5);

--1.10. Incluir 10 empleados de los cuales 6 son docentes, de los cuales 3 trabajaran en esta obra, un director que tambien hizo de evaluador, un coordinador de sinfonica que tambien fue evaluador y un evaluador. Incluir 4 administrativos, de los cuales dos trabajaran en la obra como auxiliar general y como auxiliar de instrumentos.

--incluimos los roles
insert into rol values(0001,'administrativo');
insert into rol values(0002,'docente');

--insercion empleados
insert into empleado values('FACIN',0002,'PROR','Carlos','Reina','1000000011',3101234567,'carlos.reina@gmail.com');
insert into empleado values('FACIN',0002,'PROA','Mari','Consuelo','1023456789',3152345678,'mari.consuelo@gmail.com');
insert into empleado values('FACIN',0002,'PROV','Jose','Villada','1109876543',3213456789,'jose.villada@gmail.com');
insert into empleado values('FACAR',0002,'PROZ','Suenos','Herrera','1098765432',3104567890,'suenos.herrera@gmail.com');
insert into empleado values('FACAR',0002,'PROS','Sonia','Ramirez','1012345678',3135678901,'sonia.ramirez@gmail.com');
insert into empleado values('FACAR',0002,'PROB','jhonatan','Baron','1209876543',3106789012,'jhonatan.baron@gmail.com');
insert into empleado values('RECTO',0001,'RECT','Juanito','Alimaña', '1234567890',3117890123,'juanito.alimana@gmail.com');
insert into empleado values('VICRE',0001,'VIC1','Alejandro','Daza','1111111111',3318901234,'alejandro.daza@gmail.com');
insert into empleado values('VICRE',0001,'VIC2','Batman','NoSoyWayne','1000000000',3259012345,'batman.nosoywayne@gmail.com');
insert into empleado values('VICRE',0001,'VIC3','LaDoris','Nagao','1212121212',3130123456,'ladoris.nagao@gmail.com');

--agregar personal
insert into personalobra values('FACIN',0002,'PROR',0001,'MSIM',to_date('02/02/2023','DD/MM/YYYY'),NULL);
insert into personalobra values('FACIN',0002,'PROV',0001,'MSIM',to_date('02/02/2023','DD/MM/YYYY'),NULL);
insert into personalobra values('FACAR',0002,'PROZ',0001,'MSIM',to_date('02/02/2023','DD/MM/YYYY'),NULL);
insert into personalobra values('VICRE',0001,'VIC2',0001,'MSIM',to_date('02/02/2023','DD/MM/YYYY'),NULL);
insert into personalobra values('VICRE',0001,'VIC3',0001,'MSIM',to_date('02/02/2023','DD/MM/YYYY'),NULL);

insert into laborpersonalobra values(0001,'FACIN',0002,'PROR',0001,202301,'DIRMU',2);
insert into laborpersonalobra values(0002,'FACIN',0002,'PROR',0001,202301,'EVAMU',2);
insert into laborpersonalobra values(0003,'FACIN',0002,'PROV',0001,202301,'COOSI',2);
insert into laborpersonalobra values(0004,'FACIN',0002,'PROV',0001,202301,'EVAMU',2);
insert into laborpersonalobra values(0005,'FACAR',0002,'PROZ',0001,202301,'EVAMU',2);
insert into laborpersonalobra values(0006,'VICRE',0001,'VIC2',0001,202301,'AUXGE',2);
insert into laborpersonalobra values(0007,'VICRE',0001,'VIC3',0001,202301,'AUXIN',2);

commit;



















