# Documentos UNSAAC

Colección no oficial de plantillas en [Typst](https://typst.app/) para
documentos académicos de la Universidad Nacional de San Antonio Abad del Cusco
(UNSAAC). Incluye plantillas para tesis, prácticas pre-profesionales,
diapositivas y tareas.

## Uso

Importa el paquete en cualquier documento Typst con:

```typst
#import "@preview/unsaac-docs:0.2.1": ...
```

---

## Plantillas disponibles

### Tesis / Plan de tesis

Usa `doc-tesis` como show rule principal. La plantilla incluye carátula con logo
de la UNSAAC, numeración diferenciada para páginas preliminares y contenido, y
estructura completa de capítulos.

```typst
#import "@preview/unsaac-docs:0.2.1": doc-tesis

#show: doc-tesis.with(
  titulo: [Titulo del trabajo de Tesis],
  asesor: [Nombre completo Asesor],
  autores: (
    "Nombre Completo Autor 1",
    "Nombre Completo Autor 2",
  ),
  titulo-documento: [PLAN DE TESIS],
  titulo-academico: [Ingeniero Informático y de Sistemas],
  facultad: [FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA],
  escuela: [ESCUELA PROFESIONAL DE INGENIERÍA INFORMÁTICA Y DE SISTEMAS],
  // duplex: true,       // activa márgenes para impresión doble cara
  // binding-margin: 2%, // margen extra en el lado de encuadernado
)
```

Ver la plantilla completa en [`templates/tesis.typ`](templates/tesis.typ), que
incluye todos los capítulos estándar: presentación, dedicatoria, agradecimiento,
resumen, abstract, introducción, capítulos I–V, discusiones, conclusiones,
recomendaciones, bibliografía y anexos.

---

### Prácticas pre-profesionales

#### Plan de prácticas

```typst
#import "@preview/unsaac-docs:0.2.1": doc-practica-plan-actividades, actividades-tabla

#show: doc-practica-plan-actividades.with(
  titulo: [Plan de Prácticas Pre Profesionales],
  autor: [Nombre Completo Autor],
  codigo: 100001,
  asesor: [Nombre completo Asesor],
  empresa: [Nombre de la empresa],
  jefe: [Nombre del jefe inmediato],
  area: [Soporte y tecnología de la información],
  fecha-inicio: datetime(day: 01, month: 01, year: 2001),
  horario: [Lunes a viernes, 09:00 – 13:00 hrs y 18:00 – 20:00],
  horas-por-dia: 6,
  actividades: (
    (
      nombre: [Nombre de la actividad],
      descripcion: [Descripción de la actividad],
      duracion: 30,
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("logo.png"),
)

#actividades-tabla()
```

#### Informe parcial

```typst
#import "@preview/unsaac-docs:0.2.1": doc-practica-informe-parcial, actividades-contenidos, actividades-gantt

#show: doc-practica-informe-parcial.with(
  titulo: [Informe N° 01 - Prácticas Pre Profesionales],
  autor: [Nombre Completo Autor],
  codigo: 100001,
  asesor: [Nombre completo Asesor],
  empresa: [Nombre de la empresa],
  jefe: [Nombre del jefe inmediato],
  area: [Soporte y tecnología de la información],
  fecha-inicio: datetime(day: 01, month: 01, year: 2001),
  horas-por-dia: 6,
  actividades: (
    (
      nombre: [Nombre de la actividad],
      contenido: [Descripción del contenido desarrollado],
      gantt: (
        (nombre: [Subtarea 1]),
        (nombre: [Subtarea 2]),
        (nombre: [Subtarea 3]),
      ),
      duracion: 30,
    ),
  ),
  // facultad: [],
  // escuela: [],
  // escuela-logo: image("logo.png"),
  // duplex: true,
  // binding-margin: 5%,
)

#actividades-gantt()
#actividades-contenidos()
```

---

### Tareas
````typst
#import "@preview/unsaac-docs:0.2.1": doc-tarea, src-block, src-file

#show: doc-tarea.with(
  titulo: [Laboratorio 01: Nombre de la tarea],
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
  // escuela-logo: image("logo.png"),
  // duplex: true,
  // binding-margin: 2%,
)
````

---

### Diapositivas

Basado en [Touying](https://typst.app/universe/package/touying). Para opciones
avanzadas de personalización, consulta su [documentación oficial](https://touying-typ.github.io/docs/reference).

```typst
#import "@preview/unsaac-docs:0.2.1": diapo-funcs
#import diapo-funcs: *

#show: doc-diapo.with(
  titulo: [Título de la presentación],
  subtitulo: [Subtítulo],
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
  // escuela-logo: image("logo.png"),
)
```
