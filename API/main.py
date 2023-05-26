from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from BD import ConexionBD

class estudiante(BaseModel):
    id:str
    codigoProyecto:str
    codigoDocumento:str
    nombres:str
    apellidos:str
    fechaNacimiento:str
    codigoEstudiante:str
    numDocumento:str
    correoPersonal:str
    correoInstitucional:str
    telefono:str

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

@app.get('/lista')
async def root():
    result = ConexionBD.consultarEstudiantes()
    return {"data":result}

@app.post('/agregar')
async def root(s:estudiante):
    result = ConexionBD.agregarEstudiante(s.id, s.codigoProyecto, s.codigoDocumento, s.nombres, s.apellidos, s.fechaNacimiento, s.codigoEstudiante, s.numDocumento, s.correoPersonal, s.correoInstitucional, s.telefono)
    return {"message":"hola mi loco"}