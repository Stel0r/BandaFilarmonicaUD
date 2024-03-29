from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from BD import ConexionBD
from Correo import CorreoSer

class login(BaseModel):
    correo:str
    password:str

class correo(BaseModel):
    asunto:str
    contenidos:str
    remitente:str

class estudiante(BaseModel):
    apellido:str
    codigo:int
    correoP:str
    fInscripcion:str
    fNacimiento:str
    nombre:str
    proyecto:str

class selecccion(BaseModel):
    idobra:str
    conseccalendario:int
    codestudiante:str

class peticionInactivacionPeriodo(BaseModel):
    periodo:str
    actividad:str

class InactivarConvocatoria(BaseModel):
    conseccalendario:int

class listaAsistencia(BaseModel):
    data:list
    event:int

def reasignarConvocatorio():
    resultado = []
    listEstudiantes = ConexionBD.consultarEstudianteConvocatoria()
    listInstrumentos = ConexionBD.obtenerInstrumentos()

    for estudiante in listEstudiantes:
        for instrumento in listInstrumentos:
            if estudiante[2] == instrumento[0]:
                resultado.append(instrumento + estudiante)
                listInstrumentos.remove(instrumento)

                if len(listInstrumentos) == 0:
                    break

    return resultado

app = FastAPI()

origins = [
    "http://localhost:4200"
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get('/listaEstudiantes')
async def root():
    result = ConexionBD.consultarEstudiantes()
    return {"data":result}

@app.get('/listaUnidades')
async def root():
    result = ConexionBD.consultarUnidades()
    return {"data":result}

@app.post('/agregarEstudiantes')
async def root(s:estudiante):
    ConexionBD.agregarEstudiante(str(s.codigo), s.proyecto, s.nombre, s.apellido, s.fInscripcion, s.fNacimiento, s.correoP)
    return {"message":"hola mi loco"}

@app.post('/enviarCorreo')
async def root(s:correo):
    CorreoSer.enviarCorreo(s.asunto,s.contenidos,s.remitente)
    return {"message":"hola mi loco"}

@app.get('/obtenerCalendario/{periodo}')
async def root(periodo:str):
    args = periodo.split('-')
    result = ConexionBD.consultarCalendario(args[0],args[1])
    return {"data":result}

@app.get('/listaEstudianteCon')
async def root():
    result = reasignarConvocatorio()
    return {"data":result}

@app.get('/listaLiquidacion/{periodo}')
async def root(periodo:str):
    result = ConexionBD.consultarLiquidacion(periodo)
    return {"data":result}

@app.post('/inactivarAct')
async def root(peticion:peticionInactivacionPeriodo):
    print(peticion)
    result = ConexionBD.inactivarEventoPeriodo(peticion.actividad,peticion.periodo)
    return {"message": "completado"}

@app.get('/seleccionados/{periodo}')
async def root(periodo:str):
    result = ConexionBD.obtenerSeleccionados(periodo)
    return {"data":result}

@app.get('/periodoInactivo')
async def root():
    result = ConexionBD.periodoInactivo()
    return {"data":result}

@app.post('/registrarSeleccion')
async def root(s:selecccion):
    ConexionBD.agregarParticipacion(str(ConexionBD.maxIdParticipacion()[0][0]),s.idobra,str(s.conseccalendario),s.codestudiante)
    return {"message":"hola mi loco"}

@app.post('/inactivarCalendario')
async def root(peticion:InactivarConvocatoria):
    print(peticion)
    result = ConexionBD.inactivarConvocatoria(str(peticion.conseccalendario))
    return {"message": "completado"}

@app.get('/calendario/{periodo}')
async def root(periodo):
    result = ConexionBD.obtenerCalendario(periodo)
    return {"data":result}

@app.post('/subirAsistencia')
async def root(body:listaAsistencia):
    for e in body.data:
        ConexionBD.subirAsistencia(e,body.event)    

@app.get('/obtenerPeriodos')
async def root():
    result = ConexionBD.obtenerPeriodos()
    return {"data":result}
    
@app.post('/validate')
async def root(l:login):
    valid = ConexionBD.validarLogin(l.correo,l.password)
    if valid:
        return {"message":"logeado correctamente",
                "codigo" : 202}
    else:
        return {"message":"la contraseña o Correo son incorrectos, intentelo nuevamente",
                "codigo" : 404}