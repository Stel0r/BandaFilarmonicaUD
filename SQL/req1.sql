--1.2. Los Géneros: 1 Música Culta; 2 Música Folclórica; 3 Música Popular
Insert into generoobra values("MC","Musica Culta"),("MF","Musica Folclórica"),("MP","Musica Popular");
--1.3. 5 obras reales con su compositor y país de donde se le considera la procedencia
insert into pais values
                    ("DEU","Alemania"),
                    ("AUT","Austria")
insert into compositor values
                        ("BAC","Bach","DEU"),
                        ("MOZ","Mozart","AUT"),
                        ("HAN","Handel","DEU"),
                        ("BRA","Brahms","DEU");
insert into obra values
                    ("MSIM","MC","DEU",202301,"BAC",to_date("27/07/1733","DD/MM/YYYY"),"Misa en si menor",true,),
                    ("PSSM","MC","DEU",202201,"BAC",to_date("15/04/1729","DD/MM/YYYY"),"Pasión de según San Mateo",false),
                    ("REQU","MC","AUT",202202,"MOZ",to_date("02/01/1793","DD/MM/YYYY"),"Requiem",false),
                    ("MESI","MC","DEU",202101,"HAN",to_date("13/04/1742","DD/MM/YYYY"),"Mesias",false),
                    ("REAL","MC","DEU",202102,"BRA",to_date("10/04/1868","DD/MM/YYYY"),"Un Requiem Aleman",false);
--1.4. Incluir 6 instrumentos reales de cada obra. Tener en cuenta que 2 instrumentos son repetidos. Por ejemplo, 2 registro de violín.
insert into instrumento values
                            ("CANT","Cantantes"),
                            ("VIOL","Violin"),
                            ("VIOA","Viola"),
                            ("CHEL","Chelo"),
                            ("OBOE","Oboe"),
                            ("FLAU","Flauta"),
                            ("ORGA","Organo"),
                            ("BAJO","Bajo");
    --Misa en SI menor
        insert into relationship_26 values
                                        ("VIOL","MSIM",1),
                                        ("VIOL","MSIM",2),
                                        ("CANT","MSIM",1),
                                        ("FLAU","MSIM",1),
                                        ("BAJO","MSIM",1),
                                        ("VIOA","MSIM",1);
    --Pasión de Según San Mateo
        insert into relationship_26 values
                                        ("FLAU","PSSM",1),
                                        ("FLAU","PSSM",2),
                                        ("OBOE","PSSM",1),
                                        ("OBOE","PSSM",2),
                                        ("BAJO","PSSM",1),
                                        ("VIOL","PSSM",1);
    --Requiem
        insert into relationship_26 values
                                        ("CHEL","REQU",1),
                                        ("BAJO","REQU",1),
                                        ("VIOL","REQU",1),
                                        ("VIOL","REQU",2),
                                        ("ORGA","REQU",1),
                                        ("fLAU","REQU",1);   
--1.5. Incluir 3 períodos, que equivale al año y el semestre así (202202, 202301, etc)
insert into periodo values
                        (202202),
                        (202301),
                        (202202),
                        (202101),
                        (202102);
--1.6. Incluir la lista de actividades definidas por la UD: 1 Dirección musical 150000, 2 Evaluador musical 80000, 3 Coordinador sinfónica 100000, 4 auxiliar general 25000, auxiliar instrumentos 45000.
insert into listaactividadUD values
                                ("DIRMU",202301,"Dirección Musical",150000,2),
                                ("EVAMU",202301,"Evaluador Musical",80000,2),
                                ("COOSI",202301,"Coordinador Sinfornica",100000,2),
                                ("AUXGE",202301,"Auxiliar General",25000,2),
                                ("AUXIN",202301,"Auxiliar Instrumentos",45000,2);
--1.7. Incluir el tipo de Calendario con: 1 Planeación; 2 Convocatoria; 3 Selección; 4 Ensayo; 5 Función
insert into tipocalendario values
                                ("PA","Planeación"),
                                ("CN","Convocatoria"),
                                ("SL","Seleccion"),
                                ("EN","Ensayo"),
                                ("FN","Funcion");
--1.8. Incluir 10 unidades de las cuales 8 son académicas y 2 administrativas. Ejemplo, Si se incluye un proyecto curricular, deben incluir toda su dependencia (Rectoria, vicerrectoría, Facultad, proyecto)
insert into tipounidad values 
                            ("AD","Administrativa"),
                            ("AC","Academica");
insert into unidad values  
                    ("RECTO","AD",null,"Rectoria"),
                    ("VICRE","AD","RECTO","Vicerrectoria Academica"),
                    ("FACIN","AC","VICRE","Facultad de Ingenieria"),
                    ("INGSI","AC","FACIN","Ingenieria de Sistemas"),
                    ("INGEL","AC","FACIN","Ingenieria Electronica"),
                    ("INGCA","AC","FACIN","Ingenieria Catastral"),
                    ("FACAR","AC","VICRE","Facultad de Artes"),
                    ("ARTDA","AC","FACAR","Arte Danzario"),
                    ("ARTMU","AC","FACAR","Artes Musicales"),
                    ("ARTES","AC","FACAR","Artes Escenicas"),
--1.9. Incluir 15 estudiantes inscritos, de los cuales 10 participan en la convocatoria del periodo actual (202301) y 8 obtuvieron calificación superior a 4.2. Tenga en cuenta que solo pueden participar en la convocatoria los instrumentos relacionados con la obra.

--ingresamos los estudiantes 
insert into estudiante values
                        ("20201020009","INGSI","Diego","Gamez",to_date('15/05/2020','dd/mm/yyyy'),to_date('10/11/2002','dd/mm/yyyy'),"diego.felipe.gamez@gmail.com"),
                        ("20201020036", "INGSI", "Juan", "Vanegas", to_date('15/05/2020','dd/mm/yyyy'), to_date('10/01/2000','dd/mm/yyyy'), "juanesvanegas1102@gmail.com"),
                        ("20201020008", "INGSI", "Harrinson", "Toledo", to_date('20/09/2020','dd/mm/yyyy'), to_date('25/07/1999','dd/mm/yyyy'), "ironstar2003@gmail.com"),
                        ("20230303003", "INGSI", "Andrés", "López", to_date('14/08/2023','dd/mm/yyyy'), to_date('05/03/2001','dd/mm/yyyy'), "andres.lopez@gmail.com"),
                        ("20210404004", "INGSI", "Laura", "Martínez", to_date('02/07/2021','dd/mm/yyyy'), to_date('18/11/1998','dd/mm/yyyy'), "laura.martinez@gmail.com"),
                        ("20200505005", "ARTES", "Carlos", "Rodríguez", to_date('30/06/2020','dd/mm/yyyy'), to_date('23/09/2000','dd/mm/yyyy'), "carlos.rodriguez@gmail.com"),
                        ("20230606006", "ARTDA", "Ana", "Hernández", to_date('05/03/2023','dd/mm/yyyy'), to_date('15/02/1997','dd/mm/yyyy'), "ana.hernandez@gmail.com"),
                        ("20210707007", "ARTDA", "Pedro", "Sánchez", to_date('25/12/2021','dd/mm/yyyy'), to_date('08/06/1996','dd/mm/yyyy'), "pedro.sanchez@gmail.com"),
                        ("20200808008", "ARTMU", "Sofía", "Ramírez", to_date('11/09/2020','dd/mm/yyyy'), to_date('29/04/1995','dd/mm/yyyy'), "sofia.ramirez@gmail.com"),
                        ("20220909009", "INGCA", "Luis", "Torres", to_date('19/11/2022','dd/mm/yyyy'), to_date('10/07/1994','dd/mm/yyyy'), "luis.torres@gmail.com"),
                        ("20231010010", "ARTES", "Ana", "Gómez", to_date('28/03/2023','dd/mm/yyyy'), to_date('12/09/1997','dd/mm/yyyy'), "ana.gomez@gmail.com"),
                        ("20211211011", "INGSI", "Juan", "Herrera", to_date('03/08/2021','dd/mm/yyyy'), to_date('25/11/1996','dd/mm/yyyy'), "juan.herrera@gmail.com"),
                        ("20201312012", "ARTES", "María", "López", to_date('10/05/2020','dd/mm/yyyy'), to_date('20/02/1998','dd/mm/yyyy'), "maria.lopez@gmail.com"),
                        ("20221413013", "ARTMU", "Pedro", "García", to_date('07/11/2022','dd/mm/yyyy'), to_date('15/07/1995','dd/mm/yyyy'), "pedro.garcia@gmail.com"),
                        ("20201514014", "ARTDA", "Laura", "Martínez", to_date('19/09/2020','dd/mm/yyyy'), to_date('10/04/1994','dd/mm/yyyy'), "laura.martinez@gmail.com");

--creamos la convocatoria
insert into convocatoriaestudiante values
                                        ("MSIM",001,"20201020009","VIOL",to_date('02/02/2023','dd/mm/yyyy'),to_date('17/02/2023','dd/mm/yyyy'),4.4),
                                        ("MSIM",001,"20201020036","VIOL",to_date('02/02/2023','dd/mm/yyyy'),to_date('17/02/2023','dd/mm/yyyy'),4.8),
                                        ("MSIM",001,"20201020008","CANT",to_date('02/02/2023','dd/mm/yyyy'),to_date('17/02/2023','dd/mm/yyyy'),4.5),
                                        ("MSIM", 001, "20221413013", "VIOL", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 2),
                                        ("MSIM", 001, "20220909009", "FLAU", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 4.5),
                                        ("MSIM", 001, "20211211011", "FLAU", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 4.6),
                                        ("MSIM", 001, "20210404004", "BAJO", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 4.7),
                                        ("MSIM", 001, "20200505005", "CANT", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 1),
                                        ("MSIM", 001, "20230606006", "VIOA", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 4.4),
                                        ("MSIM", 001, "20210707007", "VIOA", to_date('02/02/2023','dd/mm/yyyy'), to_date('17/02/2023','dd/mm/yyyy'), 5);

--1.10. Incluir 10 empleados de los cuales 6 son docentes, de los cuales 3 trabajarán en esta obra, un director que también hizo de evaluador, un coordinador de sinfónica que también fue evaluador y un evaluador. Incluir 4 administrativos, de los cuales dos trabajarán en la obra como auxiliar general y como auxiliar de instrumentos.

--incluimos
insert into rol values
                    (0001,"administrativo"),
                    (0002,"docente");

insert into empleado values 
                        ("FACIN",0002,"PROR","Carlos","Reina","1000000011",3101234567,"carlos.reina@gmail.com"),
                        ("FACIN",0002,"PROA","Mari","Consuelo","1023456789",3152345678,"mari.consuelo@gmail.com"),
                        ("FACIN",0002,"PROV","Jose","Villada","1109876543",3213456789,"jose.villada@gmail.com"),
                        ("FACAR",0002,"PROZ","Sueños","Herrera","1098765432",3104567890,"suenos.herrera@gmail.com"),
                        ("FACAR",0002,"PROS","Sonia","Ramirez","1012345678",3135678901,"sonia.ramirez@gmail.com"),
                        ("FACAR",0002,"PROB","jhonatan","Baron","1209876543",3106789012,"jhonatan.baron@gmail.com"),
                        ("RECTO",0001,"RECT","Juanito","Alimaña", "1234567890",3117890123,"juanito.alimana@gmail.com"),
                        ("VICRE",0001,"VIC1","Alejandro","Daza","1111111111",3318901234,"alejandro.daza@gmail.com"),
                        ("VICRE",0001,"VIC2","Batman","NoSoyWayne","1000000000",3259012345,"batman.nosoywayne@gmail.com"),
                        ("VICRE",0001,"VIC3","LaDoris","Nagao","1212121212",3130123456,"ladoris.nagao@gmail.com");

--WIP{FAlta agregar lista Actividad}
insert into personalobra values
                            ("FACIN",0002,"PROR"),
                            ("FACIN",0002,"PROV"),
                            ("FACIN",0002,"PROZ"),
                            ("RECTO",0001,"RECT"),
                            ("VICRE",0001,"VIC1"),
                            ("VICRE",0001,"VIC2"),
                            ("VICRE",0001,"VIC3");
























