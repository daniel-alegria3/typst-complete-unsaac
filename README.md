# Documentos UNSAAC
Coleccion (no official) de plantillas en typst para documentos de tesis,
practicas pre-profesionales, diapositivas y tareas en general.

<!-- TODO: add a table to preview the documents -->

## Tesis
```
#import "@preview/unsaac-docs:0.2.1": doc-tesis, src-block, src-file

#set text(size: 5pt)

#show: doc-tesis.with(
  titulo: ["#smallcaps([Diseño de un sistema de garantía de calidad de servicio mediante aprendizaje
      por refuerzo en arquitecturas de redes definidas por software])"],
  asesor: [Nombre completo Asesor],
  autores: (
    "Nombre Completo Autor 1",
    "Nombre Completo Autor 2",
  ),
  // facultad: [],
  // escuela: [],
)

#outline(title: "Tabla de Contenido")
#pagebreak()

= Resumen
#lorem(50)
```

## Practicas pre-profesionales
### Plan de practicas
```
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
      parrafo: [ #lorem(50) ],
      duracion: 30,
    ),
    (
      nombre: [ #lorem(10) ],
      parrafo: [ #lorem(50) ],
      duracion: 42,
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("ejemplo.png"),
)


#v(1em)
#heading(numbering: none, outlined: false)[Plan de Actividades]
#actividades-tabla()
```

### Informe parcial
```
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
      parrafo: [ #lorem(50) ],
      lista: (
        (nombre: [#lorem(10)]),
        (nombre: [#lorem(10)]),
        (nombre: [#lorem(10)]),
      ),
      duracion: 30,
    ),
    (
      nombre: [ #lorem(10) ],
      parrafo: [ #lorem(50) ],
      lista: (
        (nombre: [#lorem(10)], duracion: 18),
        (nombre: [#lorem(10)], duracion: 12),
        (nombre: [#lorem(10)], duracion: 24),
      ),
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("ejemplo.png"),
)

= Diagrama de actividades
#actividades-gantt()

= Actividades Realizadas
#actividades-parrafos()

= Dificultades Encontradas
#lorum(50)

= Conclusiones del Mes
#lorum(50)

= Plan para el siguiente Mes
#lorum(50)
```

## Tareas
````
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
)

#set heading(numbering: none)

#heading(level: 1)[
  Marco Teorico
]

#src-block[
  ```bash
  echo "Hello World!"
  ```
]
// #src-file("./script.sh")
````

## Diapos
Usa (touying)[https://typst.app/universe/package/touying], para aprender mas
acerca de customizacion, ver su (documentacion)[https://touying-typ.github.io/docs/reference].

```
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

/*
#show: touying-set-config.with(
  config-common(
    handout: true,
  ),
)
#show: touying-set-config.with(
  config-colors(
    primary: rgb("#4f46e5"),
    primary-light: rgb("#c7d2fe"),
    secondary: rgb("#0f172a"),
    neutral-lightest: rgb("#f8fafc"),
    neutral-dark: rgb("#334155"),
    neutral-darkest: rgb("#0f172a"),
  ),
)
#show: touying-set-config.with(
  config-store(
    align: start,
    footer: self => self.info.curso,
  ),
)
#show: touying-set-config.with(
  config-methods(
    cover: utils.color-changing-cover.with(color: rgb("#8b5e5e")),
  ),
)
*/

#title-slide()

#components.adaptive-columns(outline(title: none, indent: 1em, depth: 2))

= The Slide Function
#slide(composer: (2fr, 1fr))[
  == Subtitle 2

  + #lorem(20)

  #pause

  + #lorem(20)

  #pause

  + #lorem(20)
][
  #meanwhile

  #rect(width: 100%, height: 100%)
]

/*
#show: touying-set-config.with(
  config-common(
    slide-level: 1,
    new-section-slide-fn: new-section-slide,
  ),
)
*/

= Topic1

== Subtopic A
#lorem(20)
== Subtopic B
#lorem(20)
=== Subsubtopic a
#lorem(50)
=== Subsubtopic b
#lorem(50)

= Topic2

== Subtopic X
#lorem(20)
== Subtopic Y
#lorem(20)
=== Subsubtopic x
#lorem(50)
=== Subsubtopic y
#lorem(50)

#focus-slide[GRACIAS POR SU ATENCION!]
```
