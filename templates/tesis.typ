#import "@preview/complete-unsaac:0.2.2": (
  corolario, definicion, doc-tesis, sty-tesis-anexos, sty-tesis-base, sty-tesis-post, sty-tesis-pre,
  teorema,
)
#import "@preview/complete-unsaac:0.2.2": corolario, definicion, teorema

#let facu = highlight[Ingrese su facultad]
#let ep = highlight[Ingrese su E.P.]
#let titulo = highlight[Titulo del trabajo de Tesis]
#let titulo-prof = highlight[Ingrese su grado académico]

#show: doc-tesis.with(
  titulo: titulo,
  asesor: [Nombre completo Asesor],
  co-asesor: [Nombre completo Co-Asesor],
  autores: (
    "Nombre Completo Autor 1",
    "Nombre Completo Autor 2",
  ),
  titulo-documento: [PLANTILLA DE TESIS],
  facultad: facu,
  escuela: ep,
  titulo-academico: titulo-prof,
  // duplex: true,
  // binding-margin: 2%,
)

// =========================== PÁGINAS PRELIMINARES ============================
#show: sty-tesis-pre

= Presentación

#[
  #set par(first-line-indent: 0em)

  *SEÑOR:* DECANO DE LA FACULTAD DE #upper(facu) DE LA UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL
  CUSCO \
  *SEÑOR:* DIRECTOR DE LA ESCUELA PROFESIONAL DE #upper(ep) \
  *SEÑORES:* DOCENTES MIEMBROS DEL JURADO

  Con la conformidad del reglamento de grados y títulos de la Escuela Profesional de #upper[ep],
  pongo a consideración el presente trabajo de tesis intitulado: *"#titulo"* para optar al Título
  Profesional de *#titulo-prof*.

  #lorem(50)

  #lorem(20)

  #align(right)[
    Atentamente,

    Br. Nombre completo del autor
  ]
]

= Dedicatoria
#pad(left: 30%)[
  #set align(right)

  #lorem(50)

  #v(1cm)

  _Nombre del autor_
]

= Agradecimiento
#lorem(150)

= Índice
#outline(title: none)

= Índice de Tablas
#outline(title: none, target: figure.where(kind: table))

= Índice de Figuras
#outline(title: none, target: figure.where(kind: image))

= Resumen
#lorem(100)

*Palabras clave:* #lorem(10)

= Abstract

#lorem(100)

*Keywords:* #lorem(10)

// --- Introducción ---
= Introducción

#lorem(80)

#lorem(80)

#lorem(80)

#lorem(80)

#lorem(80)

// =========================== CONTENIDO PRINCIPAL =============================
#show: sty-tesis-base

= Planteamiento del problema
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

= Marco teórico conceptual

== Antecedentes
=== Antecedentes internacionales

#lorem(50)

=== Antecedentes nacionales

#lorem(50)

=== Antecedentes locales

#lorem(100)

== Bases Teóricas <sec>

Asimismo en la plantilla se pueden incluir figuras, tablas y fórmulas. Los ejemplos se muestran a
continuación:

#block[
  #figure(
    // image("ruta/a/imagen.png", width: 13.5cm),
    rect(width: 13.5cm, height: 8cm, fill: luma(230)),
    caption: [
      Conducta de inventario en el modelo clásico económica de pedido (EOQ)
    ],
  )
] <img>
*Fuente:* Elaboración propia.

#figure(
  kind: table,
  caption: [Resumen de actividades basadas en costos (ABC)],
  table(
    columns: (auto, auto, auto, auto),
    align: left,
    table.header(
      [*Grupo*],
      [*(%) de Costos*],
      [*(%) ocupación del inventario*],
      [*Usar técnicas cuantitativas*],
    ),
    [*A*], [$70%$], [$10%$], [Si],
    [*B*], [$20%$], [$20%$], [Los que tienen costos altos],
    [*C*], [$10%$], [$70%$], [No],
  ),
) <tbl>

Para insertar definiciones, teoremas y corolarios: #definicion[
  Sea $bold(f): D -> RR^m$, donde $D subset RR^n$, entonces $bold(f(x))$ tiene límite
  $bold(L) = (L_1, L_2, dots.h, L_m)$ cuando $bold(x) -> bold(a)$, si para cada $epsilon > 0$ existe
  $delta > 0$ tal que $norm(bold(f(x)) - bold(L)) < epsilon$ para todo
  $bold(x) in D inter N_delta^d (bold(a))$.
] <def>

#teorema[
  Sea $f$ definida en un punto $x_0$. Si $f$ tiene una derivada en $x_0$, entonces es continua en
  $x_0$.
] <teo>

#corolario[Sea esto un corolario en $f$.] <col>

Insertar ecuaciones:

$ A = B + C $ <eq>

== Marco conceptual

#[
  #set par(first-line-indent: 0em)
  *Primer marco:* #lorem(20)

  *Segundo marco:* #lorem(20)
]

= Hipótesis y variables

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

#page(flipped: true)[
  == Operacionalización de variables

  #figure(
    kind: table,
    caption: [Matriz de operacionalización de variables],
    table(
      columns: 5,
      align: (left, left, left, right, right),
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
  )
]

= Metodología

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

= Resultados

#lorem(500)


// =========================== SECCIONES FINALES ===============================
#show: sty-tesis-post

= Discusiones

#lorem(300)

= Conclusiones

Según los resultados obtenidos mediante el trabajo de investigación se obtienen las siguientes
conclusiones:

+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)

= Recomendaciones

+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)
+ #lorem(30)

// =========================== BIBLIOGRAFÍA ====================================

= Bibliografía

// Reemplazar con la ruta al archivo .bib:
// #bibliography("contenido/bibliog.bib", style: "apa")

// =========================== ANEXOS ==========================================
#show: sty-tesis-anexos

= Anexos

#page(flipped: true)[
  == Matriz de consistencia

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
