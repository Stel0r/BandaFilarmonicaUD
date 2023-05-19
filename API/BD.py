import oracledb

class ConexionBD:

    def consultarEstudiantes():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user="OrquestaUD", password="FilarmonicaUD",host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        result = cursor.execute("SELECT * FROM ESTUDIANTE")
        for row in result:
            print(row)
        return result

    def agregarEstudiante(id,codigoProyecto,codigoDocumento,nombres,apellidos,fechaNacimiento,codigoEstudiante,numDocumento,correoPersonal,correoInstitucional,telefono):
        connection = oracledb.connect(user="OrquestaUD", password="FilarmonicaUD",host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        query = "INSERT INTO estudiante values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        args = (id,codigoProyecto,codigoDocumento,nombres,apellidos,fechaNacimiento,codigoEstudiante,numDocumento,correoPersonal,correoInstitucional,telefono)
        result = cursor.update(query,args)
        connection.close()
        return result


