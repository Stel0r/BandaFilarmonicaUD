import oracledb

class ConexionBD:

    user = "AdminFilarmonica"
    password = "Administracion"

    def consultarEstudiantes():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user= ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM estudiante")
        result = cursor.fetchall()
        connection.close()
        return result

    def agregarEstudiante(id,codigoProyecto,codigoDocumento,nombres,apellidos,fechaNacimiento,codigoEstudiante,numDocumento,correoPersonal,correoInstitucional,telefono):
        connection = oracledb.connect(user=ConexionBD.user, password=ConexionBD.password,host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        query = "INSERT INTO estudiante values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"
        args = (id,codigoProyecto,codigoDocumento,nombres,apellidos,fechaNacimiento,codigoEstudiante,numDocumento,correoPersonal,correoInstitucional,telefono)
        result = cursor.update(query,args)
        connection.close()
        return result


