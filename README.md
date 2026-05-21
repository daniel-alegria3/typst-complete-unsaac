# Documentos UNSAAC
Coleccion (no official) de plantillas en typst para documentos de tesis,
practicas pre-profesionales, diapositivas y tareas en general.

## Tesis
```typst
#import "@preview/unsaac-docs:0.2.1": doc-tesis, src-block, src-file
#show: doc-tesis.with(
  titulo: [Titulo del trabajo de Tesis],
  asesor: [Nombre completo Asesor],
  autores: (
    "Nombre Completo Autor 1",
    "Nombre Completo Autor 2",
  ),
  titulo-documento: [PLAN DE TESIS],
  // titulo-profesional: [],
  // facultad: [],
  // escuela: [],
  // duplex: true,
  // binding-margin: 2%,
)
```

## Practicas pre-profesionales
### Plan de practicas
```typst
#import "@preview/unsaac-docs:0.2.1": doc-practica-plan-actividades, actividades-tabla
#show: doc-practica-plan-actividades.with(
  titulo: [Plan de Prácticas Pre Profesionales],
  autor: [Nombre Completo Autor],
  codigo: 100001,
  asesor: [],
  empresa: [],
  jefe: [],
  area: [Soporte y tecnología de la información],
  fecha-inicio: datetime(day: 01, month: 01, year: 2001),
  horario: [Lunes a viernes, 09:00 – 13:00 hrs y 18:00 – 20:00],
  horas-por-dia: 6,
  actividades: (
    (
      nombre: [ #lorem(10) ],
      descripcion: [ #lorem(50) ],
      duracion: 30,
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("ejemplo.png"),
)
#actividades-tabla()
```

### Informe parcial
```typst
#import "@preview/unsaac-docs:0.2.1": doc-practica-informe-parcial, actividades-contenidos, actividades-gantt
#show: doc-practica-informe-parcial.with(
  titulo: [Informe N° 0X - Prácticas Pre Profesionales],
  autor: [Nombre Completo Autor],
  codigo: 100001,
  asesor: [],
  empresa: [],
  jefe: [],
  area: [Soporte y tecnología de la información],
  fecha-inicio: datetime(day: 01, month: 01, year: 2001),
  // horario: [Lunes a viernes, 09:00 – 13:00 hrs y 18:00 – 20:00],
  horas-por-dia: 6,
  actividades: (
    (
      nombre: [ #lorem(10) ],
      contenido: [ #lorem(50) ],
      gantt: (
        (nombre: [#lorem(10)]),
        (nombre: [#lorem(10)]),
        (nombre: [#lorem(10)]),
      ),
      duracion: 30,
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("ejemplo.png"),
  // duplex: true,
  // binding-margin: 5%,
)
#actividades-gantt()
#actividades-contenidos()
```

## Tareas
````typst
#import "@preview/unsaac-docs:0.2.1": doc-tarea, src-block, src-file
#show: doc-tarea.with(
  titulo: [Laboratorio 0X: #lorem(20)],
  curso: [Nombre del Curso],
  docente: [Nombre Completo Docente],
  autores: (
    (
      nombre: "Nombre Completo Autor 1",
      codigo: "100001",
    ),
    (
      nombre: "Nombre Completo Autor 2",
      codigo: "200002",
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("ejemplo.png"),
  // duplex: true,
  // binding-margin: 2%,
)
````

## Diapos
Usa (touying)[https://typst.app/universe/package/touying], para aprender mas
acerca de customizacion, ver su (documentacion)[https://touying-typ.github.io/docs/reference].

```typst
#import "@preview/unsaac-docs:0.2.1": diapo-funcs, src-block, src-file
#import diapo-funcs: *

#show: doc-diapo.with(
  titulo: [Titulo],
  subtitulo: [SubTitulo],
  curso: [Curso],
  docente: [Docente],
  autores: (
    (
      nombre: "Nombre Completo Autor 1",
      codigo: "100001",
    ),
    (
      nombre: "Nombre Completo Autor 2",
      codigo: "200002",
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("ejemplo.png"),
)
```
