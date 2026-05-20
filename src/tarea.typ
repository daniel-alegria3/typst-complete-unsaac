#import "@preview/numbly:0.1.0": numbly
#import "./utils/fecha.typ": fecha_str

#let doc-tarea(
  curso: none,
  titulo: none,
  docente: none,
  fecha: auto,
  autores: (),
  /// school specific
  facultad: [FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA],
  escuela: [ESCUELA PROFESIONAL DE INGENIERÍA INFORMÁTICA Y DE SISTEMAS],
  escuela-logo: image("../imgs/escuela_logo.png"),
  ///
  duplex: false,
  binding-margin: 0%,
  doc,
) = {
  let margin = 2.54cm
  let margins = if duplex {
    (
      inside: margin + binding-margin,
      outside: margin - binding-margin,
    )
  } else {
    (
      left: margin + binding-margin,
    )
  }

  //================================ {General} =================================
  set page(
    paper: "a4",
    margin: (
      ..margins,
      rest: margin,
    ),
  )
  set text(
    font: "TeX Gyre Termes",
    // size: 11pt,
    spacing: 0.35em,
    lang: "es",
    region: "pe",
  )
  set par(
    first-line-indent: 1.2em,
    // spacing: 2em,
    leading: 0.65em,
    justify: true,
  )
  set heading(
    numbering: "1.",
  )
  set document()

  //=============================== {Overrides} ================================
  show outline.entry.where(level: 1): set block(above: 1.4em)
  show heading.where(level: 1): set block(below: 1em)
  set list(indent: 1.2em, spacing: 0.85em)
  set enum(indent: 1.2em, spacing: 0.85em)
  /// TODO: https://github.com/typst/typst/issues/905
  set enum(full: true, numbering: numbly("{1}.", "{2:a})", "({3})", default: "1."))

  //================================ {Caratula} ================================
  page(
    margin: (
      rest: margin,
    ),
  )[
    #place(
      float: true,
      auto,
      scope: "parent",
      clearance: 2em,
    )[
      #set par(first-line-indent: 0em)

      #text(1.35em)[
        UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO
      ]

      #text(1.40em)[#facultad]

      #text(1.26em)[#escuela]

      // #v(1fr)
      #v(3em)

      #block(height: 6cm)[
        #grid(
          columns: (1fr, 1fr),
          image("../imgs/unsaac_logo.png"), escuela-logo,
        )
      ]

      #v(3em)
      // #v(1fr)

      #text(1.35em)[
        #smallcaps[#curso]
      ]

      #v(1em)
      #text(1.35em)[
        *#titulo*
      ]

      #v(1.5em)
      #text(1.1em)[
        #align(left)[
          #set par(justify: false)

          #if docente != none [
            DOCENTE: #h(1fr) #docente
          ]

          #if autores.len() > 1 [
            INTEGRANTES:

            #grid(
              columns: (7fr, 1fr),
              row-gutter: 1em,
              align: right,

              ..autores
                .map(autor => (
                  autor.nombre,
                  [(#autor.codigo)],
                ))
                .flatten(),
            )
          ] else if autores.len() == 1 [
            #let (nombre, codigo) = autores.at(0)
            ALUMNO: #h(7fr) #nombre (#codigo)
          ]
        ]
      ]


      #v(1fr)
      #text(1.2em)[
        Perú \
        #if fecha != auto [
          #fecha
        ] else [
          #fecha_str(datetime.today())
        ]
      ]
    ]
  ]
  pagebreak()

  //============================= {Document Body} ==============================
  doc
}
