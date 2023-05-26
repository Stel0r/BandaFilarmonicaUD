from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from BD import ConexionBD

class estudiante(BaseModel):
    apellido:str
    codigo:int
    correoP:str
    fInscripcion:str
    fNacimiento:str
    nombre:str
    proyecto:str

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
    print(s.apellido)
    result = ConexionBD.agregarEstudiante(str(s.codigo), s.proyecto, s.nombre, s.apellido, s.fInscripcion, s.fNacimiento, s.correoP)
    return {"message":"hola mi loco"}