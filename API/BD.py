import oracledb

class ConexionBD:

    user = "AdminFilarmonica"
    password = "Administracion"

    def consultarEstudiantes():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        cursor.execute("select e.codestudiante, u.nomunidad, e.nombre, e.apellido, e.fechainscripcion, e.fechanacimiento, e.correo from estudiante e, unidad u where u.codunidad = e.codunidad")
        result = cursor.fetchall()
        connection.close()
        return result

    def agregarEstudiante(codigoEstudiante, codigoProyecto, nombres, apellidos, fechaInscripcion, fechaNacimiento, correoPersonal):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        query = "INSERT INTO estudiante values('"+codigoEstudiante+"','"+codigoProyecto+"','"+nombres+"','"+apellidos+"',to_date('"+fechaInscripcion+"','yyyy-mm-dd'),to_date('"+fechaNacimiento+"','yyyy-mm-dd'),'"+correoPersonal+"')"
        result = cursor.execute(query)
        connection.commit()
        connection.close()
        return result

    def consultarUnidades():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        cursor.execute("select f.nomunidad, p.nomunidad, p.codunidad from unidad f, unidad p where f.codunidad = p.uni_codunidad and f.tipounidad like 'AC'")
        result = cursor.fetchall()
        connection.close()
        return result
    
    def consultarCalendario(periodo:str,mes:str):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        query = "select o.titulo, t.desctipocalendario, c.idestado, c.fechainicio, c.fechafin, o.idobra, c.conseccalendario from obra o,tipocalendario t, calendario c where t.idtipocalen = c.idtipocalen and o.idobra = c.idobra and o.idperiodo = "+periodo+" and extract(MONTH from c.fechainicio) = "+mes+" ORDER BY c.fechainicio"
        cursor.execute(query)
        result = cursor.fetchall()
        connection.close()
        return result

    def inactivarEventoPeriodo(tipoCalen:str,periodo:str):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        query = "update calendario c set c.idestado = 'Inactivo' where idObra in (select o.idObra from obra o where o.idperiodo = "+periodo+") and c.idtipocalen = '"+tipoCalen+"'"
        cursor.execute(query)
        connection.commit()
        connection.close()

    def consultarEstudianteConvocatoria():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        cursor.execute("select e.codEstudiante, e.nombre, e.apellido, f.nomUnidad, c.nomUnidad, i.nomInstrumento, max(con.calificacion) " 
        +"from estudiante e, unidad f, unidad c, convocatoriaEstudiante con, instrumento i " 
        +"where c.codunidad = e.codunidad and f.codunidad = c.uni_codunidad and  i.idInstrumento = con.idInstrumento and e.codEstudiante = con.codEstudiante and " 
        +"(con.idInstrumento,con.calificacion) in (select idInstrumento, max(calificacion) from convocatoriaEstudiante group by idInstrumento) "
        +"group by i.idinstrumento, e.codEstudiante, e.nombre, e.apellido, f.nomUnidad, c.nomUnidad, i.nomInstrumento")
        result = cursor.fetchall()
        connection.close()
        return result
    
    def consultarLiquidacion(periodo:str):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        cursor.execute("select e.nombre ||' '|| e.apellido Estudiante, e.codestudiante codigo, un.nomunidad facultad, e.correo correo, " +
                        "sum(trunc(mod((c.fechafin - c.fechainicio)*24,24))) Nohoras " +
                        "from estudiante e, unidad u, unidad un, calendario c, participacionestudiante p, obra o " +
                        "where e.codestudiante = p.codestudiante and e.codunidad = u.codunidad and " +
                        "u.uni_codunidad = un.codunidad and c.conseccalendario = p.conseccalendario and " +
                        "o.idobra = c.idobra and o.idperiodo like "+ periodo +" " +
                        "group by e.nombre ||' '|| e.apellido , e.codestudiante , un.nomunidad, e.correo")
        result = cursor.fetchall()
        connection.close()
        return result


    def obtenerSeleccionados(periodo:str):
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        query = "select o.titulo, t.desctipocalendario, c.idestado, c.fechainicio, c.fechafin, o.idobra, c.conseccalendario from obra o,tipocalendario t, calendario c where t.idtipocalen = c.idtipocalen and o.idobra = c.idobra and o.idperiodo = "+periodo+" and extract(MONTH from c.fechainicio) = "+mes+" ORDER BY c.fechainicio"
        cursor.execute(query)
        result = cursor.fetchall()
        connection.close()
        return result

    def periodoInactivo():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        cursor.execute("select distinct o.idperiodo from  obra o, calendario c " +
                        "where c.idobra = o.idobra and " + 
                        "(o.idperiodo, c.conseccalendario) in (select o.idperiodo , max(c.conseccalendario) from obra o, calendario c " + 
                        "where c.idobra = o.idobra and lower(c.idtipocalen) like 'en' group by o.idperiodo) " +
                        "and lower(c.idestado) like 'inactivo'")
        result = cursor.fetchall()
        connection.close()
        return result