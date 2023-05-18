import oracledb

class ConexionBD:

    def consultarEstudiantes():
        oracledb.init_oracle_client()
        connection = oracledb.connect(user="OrquestaUD", password="FilarmonicaUD",host="localhost", port=1521, service_name="xe")
        cursor = connection.cursor()
        result = cursor.execute("SELECT * FROM ESTUDIANTE")
        for row in result:
            print(row)

