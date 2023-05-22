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
                    ("MSIM",to_date("27/07/1733","DD/MM/YYYY"),"Misa en si menor",true,"DEU","BAC","MC"),
                    ("PSSM",to_date("15/04/1729","DD/MM/YYYY"),"Pasión de según San Mateo",true,"DEU","BAC","MC"),
                    ("REQU",to_date("02/01/1793","DD/MM/YYYY"),"Requiem",true,"AUT","MOZ","MC"),
                    ("MESI",to_date("13/04/1742","DD/MM/YYYY"),"Mesias",true,"DEU","HAN","MC"),
                    ("REAL",to_date("10/04/1868","DD/MM/YYYY"),"Un Requiem Aleman",true,"DEU","BRA","MC");
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
        insert into instrumentosobra values
                                        (1,"VIOL","MSIM"),
                                        (2,"VIOL","MSIM"),
                                        (1,"CANT","MSIM"),
                                        (1,"FLAU","MSIM"),
                                        (1,"BAJO","MSIM"),
                                        (1,"VIOA","MSIM");
    --Pasión de Según San Mateo
        insert into instrumentosobra values
                                        (1,"FLAU","PSSM"),
                                        (2,"FLAU","PSSM"),
                                        (1,"OBOE","PSSM"),
                                        (2,"OBOE","PSSM"),
                                        (1,"BAJO","PSSM"),
                                        (1,"VIOL","PSSM");
    --Requiem
        insert into instrumentosobra values
                                        (1,"CHEL","REQU"),
                                        (1,"BAJO","REQU"),
                                        (1,"VIOL","REQU"),
                                        (2,"VIOL","REQU"),
                                        (1,"ORGA","REQU"),
                                        (1,"fLAU","REQU");   
--1.5. Incluir 3 períodos, que equivale al año y el semestre así (202202, 202301, etc)
insert into periodo values
                        (202202),
                        (202301),
                        (202302);
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
--1.9. Incluir 15 estudiantes inscritos, de los cuales 10 participan en la convocatoria del periodo actual (202301) y 8 obtuvieron calificación superior a 4.2. Tenga en cuenta que solo pueden participar en la convocatoria los instrumentos relacionados con la obra.
--1.10. Incluir 10 empleados de los cuales 6 son docentes, de los cuales 3 trabajarán en esta obra, un director que también hizo de evaluador, un coordinador de sinfónica que también fue evaluador y un evaluador. Incluir 4 administrativos, de los cuales dos trabajarán en la obra como auxiliar general y como auxiliar de instrumentos.