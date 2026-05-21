#import "@preview/complete-unsaac:0.2.1": doc-tesis

#show: doc-tesis.with(
  titulo: [Titulo del trabajo de Tesis],
  asesor: [Nombre completo Asesor],
  autores: (
    "Nombre Completo Autor 1",
    "Nombre Completo Autor 2",
  ),
  titulo-documento: [PLAN DE TESIS],
  facultad: [INGRESE SU FACULTAD],
  escuela: [INGRESE SU E.P.],
  titulo-academico: [INGRESE SU GRADO ACADÉMICO],
  // duplex: true,
  // binding-margin: 2%,
)

// =========================== PÁGINAS PRELIMINARES ============================
#set page(numbering: "I")
#counter(page).update(2)

// --- Presentación ---
#heading(numbering: none)[PRESENTACIÓN]

*SEÑOR:* DECANO DE LA FACULTAD DE INGRESE SU FACULTAD DE LA UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD
DEL CUSCO \
*SEÑOR:* DIRECTOR DE LA ESCUELA PROFESIONAL DE INGRESE SU E.P. \
*SEÑORES:* DOCENTES MIEMBROS DEL JURADO

Con la conformidad del reglamento de grados y títulos de la Escuela Profesional de Ingrese su E.P.,
pongo a consideración el presente trabajo de tesis intitulado: *"TITULO DEL TRABAJO DE
INVESTIGACIÓN"* para optar al Título Profesional de *INGRESE SU TÍTULO/LICENCIATURA*.

#lorem(50)

#lorem(20)

#align(right)[
  Atentamente,

  Br. Nombre completo del autor
]
#pagebreak()

// --- Dedicatoria ---
#heading(numbering: none)[DEDICATORIA]

#align(right)[
  #lorem(50)

  _Nombre del autor_
]
#pagebreak()

// --- Agradecimiento ---
#heading(numbering: none)[AGRADECIMIENTO]

#lorem(150)
#pagebreak()

// --- Índices ---
#outline(title: "Índice")
#pagebreak()

#outline(title: "Índice de Tablas", target: figure.where(kind: table))
#pagebreak()

#outline(title: "Índice de Figuras", target: figure.where(kind: image))
#pagebreak()

// --- Resumen ---
#heading(numbering: none)[RESUMEN]

#lorem(100)

*Palabras clave:* #lorem(10)
#pagebreak()

// --- Abstract ---
#heading(numbering: none)[ABSTRACT]

#lorem(100)

*Keywords:* #lorem(10)
#pagebreak()

// --- Introducción ---
#heading(numbering: none)[INTRODUCCIÓN]

#lorem(250)
#pagebreak()

// =========================== CONTENIDO PRINCIPAL =============================
#set page(numbering: "1")
#counter(page).update(1)

// =========================== CAPÍTULO I ======================================
= PLANTEAMIENTO DEL PROBLEMA

== Descripción de la situación problemática

#lorem(200)

== Formulación del problema
=== Problema general

#lorem(50)

=== Problemas específicos

- Problema específico 1
- Problema específico 2
- Problema específico 3
- Problema específico 4

== Justificación de la investigación

#lorem(50)

== Objetivos de la investigación
=== Objetivo general

#lorem(50)

=== Objetivos específicos

- Objetivo específico 1
- Objetivo específico 2
- Objetivo específico 3
- Objetivo específico 4

== Delimitación de la investigación

#lorem(50)

// =========================== CAPÍTULO II =====================================
= MARCO TEÓRICO CONCEPTUAL

== Antecedentes
=== Antecedentes internacionales

#lorem(50)

=== Antecedentes nacionales

#lorem(50)

=== Antecedentes locales

#lorem(100)

== Bases Teóricas

Asimismo en la plantilla se pueden incluir figuras, tablas y fórmulas. Los ejemplos se muestran a
continuación:

#figure(
  // image("ruta/a/imagen.png", width: 13.5cm),
  rect(width: 13.5cm, height: 8cm, fill: luma(230)),
  caption: [Conducta de inventario en el modelo clásico económica de pedido (EOQ)],
)

#figure(
  table(
    columns: (auto, auto, 1fr, 1fr),
    table.header(
      [*Grupo*], [*% de Costos*], [*% ocupación del inventario*], [*Usar técnicas cuantitativas*]
    ),
    [*A*], [$70%$], [$10%$], [Si],
    [*B*], [$20%$], [$20%$], [Los que tienen costos altos],
    [*C*], [$10%$], [$70%$], [No],
  ),
  caption: [Resumen de actividades basadas en costos (ABC)],
  kind: table,
)

Para insertar definiciones, teoremas y corolarios:

*Definición:* Sea $bold(f): D -> RR^m$, donde $D subset RR^n$, entonces $bold(f(x))$ tiene límite
$bold(L) = (L_1, L_2, dots.h, L_m)$ cuando $bold(x) -> bold(a)$, si para cada $epsilon > 0$ existe
$delta > 0$ tal que $norm(bold(f(x)) - bold(L)) < epsilon$ para todo
$bold(x) in D inter N_delta^d (bold(a))$.

*Teorema:* Sea $f$ definida en un punto $x_0$. Si $f$ tiene una derivada en $x_0$, entonces es
continua en $x_0$.

*Corolario:* Sea esto un corolario en $f$.

Insertar ecuaciones:

$ A = B + C $

== Marco conceptual

*Primer marco:* #lorem(30)

*Segundo marco:* #lorem(30)

// =========================== CAPÍTULO III ====================================
= HIPÓTESIS Y VARIABLES

== Hipótesis
=== Hipótesis general

#lorem(50)

=== Hipótesis específicas

- Hipótesis específica 1.
- Hipótesis específica 2.
- Hipótesis específica 3.
- Hipótesis específica 4.

== Identificación de variables

#lorem(50)

=== Variables dependientes

#lorem(50)

=== Variables independientes

#lorem(100)

== Operacionalización de variables

#page(flipped: true)[
  #figure(
    table(
      columns: 5,
      table.header([*Variable*], [*Definición*], [*Indicador*], [*Tipo*], [*Escala*]),
      [Variable dependiente 1], [#lorem(10)], [Indicador 1], [Tipo D1], [Escala D1],
      [Variable dependiente 2], [#lorem(10)], [Indicador 2], [Tipo D2], [Escala D2],
      [Variable dependiente 3], [#lorem(10)], [Indicador 3], [Tipo D3], [Escala D3],
      [Variable dependiente 4], [#lorem(10)], [Indicador 4], [Tipo D4], [Escala D4],
      [Variable independiente 1], [#lorem(15)], [Indicador ind 1], [Tipo I1], [Escala I1],
      [Variable independiente 2], [#lorem(15)], [Indicador ind 2], [Tipo I2], [Escala I2],
      table.cell(rowspan: 4)[Tiene subpartes], table.cell(rowspan: 4)[#lorem(10)],
      [Subind1], [Subind1 tipo], [Subind1 razón],
      [Subind2], [Subind2 tipo], [Subind2 razón],
      [Subind3], [Subind3 tipo], [Subind3 razón],
      [Subind4], [Subind4 tipo], [Subind4 razón],
    ),
    caption: [Matriz de operacionalización de variables],
    kind: table,
  )
]

// =========================== CAPÍTULO IV =====================================
= METODOLOGÍA

== Tipo de investigación

#lorem(50)

== Enfoque de la investigación

#lorem(50)

== Alcance de la investigación

#lorem(50)

== Diseño de la investigación

#lorem(50)

== Población y muestra
=== Población

#lorem(50)

=== Muestra

#lorem(50)

== Técnicas e instrumentos de recolección de datos

#lorem(50)

=== Técnica

#lorem(50)

=== Instrumento

#lorem(50)

=== Técnicas de procesamiento y análisis de datos

#lorem(50)

== Técnicas para demostrar la verdad o falsedad de las hipótesis planteadas

#lorem(100)

// =========================== CAPÍTULO V ======================================
= RESULTADOS

#lorem(500)

// =========================== SECCIONES FINALES ===============================

#heading(numbering: none)[DISCUSIONES]

#lorem(300)

#heading(numbering: none)[CONCLUSIONES]

Según los resultados obtenidos mediante el trabajo de investigación se obtienen las siguientes
conclusiones:

+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)

#heading(numbering: none)[RECOMENDACIONES]

+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)

// =========================== BIBLIOGRAFÍA ====================================

#heading(numbering: none)[BIBLIOGRAFÍA]

// Reemplazar con la ruta al archivo .bib:
// #bibliography("contenido/bibliog.bib", style: "apa")

// =========================== ANEXOS ==========================================

#heading(numbering: none)[ANEXOS]

#page(flipped: true)[
  == A. Matriz de consistencia

  #table(
    columns: 5,
    table.header([*Problemas*], [*Objetivos*], [*Hipótesis*], [*Variables*], [*Metodología*]),
    table.cell(colspan: 3)[*General*],
    [*Dependientes*],
    table.cell(rowspan: 2)[
      - *Tipo:* Colocar tipo
      - *Enfoque:* Colocar enfoque
      - *Alcance:* Colocar alcance
      - *Diseño:* Colocar diseño
      - *Población:* Colocar población
      - *Muestra:* Colocar muestra
      - *Técnica de recolección:* Colocar técnica
      - *Instrumento:* Colocar instrumento
      - *Método de análisis:* Colocar análisis
    ],
    [En esta parte se coloca el problema general],
    [En esta parte se coloca el objetivo general],
    [En esta parte se coloca la hipótesis general],
    [
      - Variable dependiente 1
      - Variable dependiente 2
    ],
    table.cell(colspan: 3)[*Específicos*],
    [*Independientes*],
    [
      - Problema específico1
      - Problema específico2
      - Problema específico3
      - Problema específico4
    ],
    [
      - Objetivo específico1
      - Objetivo específico2
      - Objetivo específico3
      - Objetivo específico4
    ],
    [
      - Hipótesis específica1
      - Hipótesis específica2
      - Hipótesis específica3
      - Hipótesis específica4
    ],
    [
      - Variable independiente1
      - Variable independiente2
      - Variable independiente3
    ],
  )
]
