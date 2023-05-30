from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from BD import ConexionBD
from Correo import CorreoSer

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

class peticionInactivacionPeriodo(BaseModel):
    periodo:str
    actividad:str

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
    result = ConexionBD.consultarEstudianteConvocatoria()
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

@app.get('/periodoInactivo')
async def root():
    result = ConexionBD.periodoInactivo()
    return {"data":result}