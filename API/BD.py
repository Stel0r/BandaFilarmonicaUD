import oracledb

class ConexionBD:

    def consultarEstudiantes():
        connection = oracledb.connect(user="OrquestaUD", password="FilarmonicaUD",host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        result = cursor.execute("select * from estudiantes;")

