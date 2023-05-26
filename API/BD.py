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


