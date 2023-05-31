-- Consultar Estudiantes
select e.codestudiante, u.nomunidad, e.nombre, e.apellido, e.fechainscripcion, e.fechanacimiento, e.correo 
from estudiante e, unidad u where u.codunidad = e.codunidad;

-- Agregar Estudiantes
INSERT INTO estudiante 
values('codigoEstudiante','codigoProyecto','nombres','apellidos',to_date('fechaInscripcion','yyyy-mm-dd'),to_date('fechaNacimiento','yyyy-mm-dd'),'correoPersonal');

-- Consultar Unidades
select f.nomunidad, p.nomunidad, p.codunidad from unidad f, unidad p where f.codunidad = p.uni_codunidad and f.tipounidad like 'AC';

-- Consultar Calendario apartir de dos parametros
select o.titulo, t.desctipocalendario, c.idestado, c.fechainicio, c.fechafin, o.idobra, c.conseccalendario,t.idtipocalen 
from obra o,tipocalendario t, calendario c where t.idtipocalen = c.idtipocalen and o.idobra = c.idobra and
 o.idperiodo = "periodo" and extract(MONTH from c.fechainicio) = "mes" ORDER BY c.fechainicio;


 -- Inactivar Periodo Planeacion
 update calendario c set c.idestado = 'Inactivo' 
 where idObra in (select o.idObra from obra o where o.idperiodo = "periodo") and c.idtipocalen = 'tipoCalen';

 -- Consultar Estudiantes Convocatoria
 select e.codEstudiante, e.nombre ||' '|| e.apellido, con.idinstrumento, con.idobra, f.nomUnidad, c.nomUnidad, i.nomInstrumento, cal.conseccalendario + 1
from estudiante e, unidad f, unidad c, convocatoriaEstudiante con, instrumento i, calendario cal 
where c.codunidad = e.codunidad and f.codunidad = c.uni_codunidad and  
i.idInstrumento = con.idInstrumento and e.codEstudiante = con.codEstudiante and 
cal.conseccalendario like
(select distinct cal.conseccalendario from calendario cal, convocatoriaestudiante cov
where TO_DATE(cal.fechainicio, 'dd/mm/yyyy') like TO_DATE(cov.fechainicio, 'dd/mm/yyyy'))
order by con.calificacion desc

-- Consultar Participacion Estudiante para liquidacion
select e.nombre ||' '|| e.apellido Estudiante, e.codestudiante codigo, un.nomunidad facultad, e.correo correo,
sum(trunc(mod((c.fechafin - c.fechainicio)*24,24))) Nohoras
from estudiante e, unidad u, unidad un, calendario c, participacionestudiante p, obra o
where e.codestudiante = p.codestudiante and e.codunidad = u.codunidad and 
u.uni_codunidad = un.codunidad and c.conseccalendario = p.conseccalendario and 
o.idobra = c.idobra and o.idperiodo like "periodo" 
group by e.nombre ||' '|| e.apellido , e.codestudiante , un.nomunidad, e.correo;

-- Obtener seleccionados
select e.nombre || ' ' || e.apellido, e.codestudiante from participacionestudiante p,estudiante e, obra o 
where e.codestudiante = p.codestudiante and p.idtipocalen = 'SL' and o.idobra = p.idobra and o.idperiodo = "periodo";

-- Obtener Periodo Inactivo
select distinct o.idperiodo from  obra o, calendario c 
where c.idobra = o.idobra and 
(o.idperiodo, c.conseccalendario) in (select o.idperiodo , max(c.conseccalendario) from obra o, calendario c 
where c.idobra = o.idobra and lower(c.idtipocalen) like 'en' group by o.idperiodo) 
and lower(c.idestado) like 'inactivo';

-- Obtener Instrumentos de una Obra
select r26.idInstrumento, r26.num from relationship_26 r26 where r26.idobra like 
(select distinct cal.idobra from calendario cal, convocatoriaestudiante cov 
where TO_DATE(cal.fechainicio, 'dd/mm/yyyy') like TO_DATE(cov.fechainicio, 'dd/mm/yyyy'));

-- Obtener el Consecasis mayor
select max(consecasis) + 1 from participacionestudiante;

-- Inactivar Calendario Convocatoria
update calendario set idestado = 'Inactivo' where conseccalendario like "conseccalendario";

-- Obtener el calendario apartir del periodo
select o.titulo, t.desctipocalendario, c.idestado, c.fechainicio, c.fechafin, o.idobra, c.conseccalendario,t.idtipocalen 
from obra o,tipocalendario t, calendario c 
where t.idtipocalen = c.idtipocalen and o.idobra = c.idobra and o.idperiodo = "periodo" ORDER BY c.fechainicio;

-- Insertar nueva asistencia en participacion estudiante
insert into participacionestudiante select "str(max+1)",c.idobra,c.idtipocalen,c.conseccalendario,"estudiante" 
from calendario c where c.conseccalendario = "str(event)";

-- Obtener periodos
select idperiodo from periodo;

-- Obtener Usuario
select * from registrousuario;