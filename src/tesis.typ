#import "@preview/numbly:0.1.0": numbly
#import "./utils/fecha.typ": fecha_str

#let doc-tesis(
  titulo: none,
  asesor: none,
  fecha: none,
  autores: (),
  titulo-documento: [TESIS],
  /// school specific
  titulo-academico: [Ingeniero Informático y de Sistemas],
  facultad: [FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA],
  escuela: [ESCUELA PROFESIONAL DE INGENIERÍA INFORMÁTICA Y DE SISTEMAS],
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
    // header: align(right + horizon)[
    //   _ #titulo _
    // ],
    // numbering: "1",
  )
  set text(
    font: "TeX Gyre Termes",
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
  set heading(numbering: "1.")
  set document()

  //=============================== {Overrides} ================================
  show outline.entry.where(level: 1): set block(above: 1.4em)
  show heading.where(level: 1): set block(below: 1em)
  set list(indent: 1.2em, spacing: 0.85em)
  set enum(indent: 1.2em, spacing: 0.85em)
  /// TODO: https://github.com/typst/typst/issues/905
  set enum(full: true, numbering: numbly("{1}.", "{2:a})", "({3})", default: "1."))

  // show heading: it => [
  //   #set align(center)
  //   #set text(13pt, weight: "regular")
  //   #block(smallcaps(it.body))
  // ]
  //
  // show heading.where(
  //   level: 2
  // ): it => text(
  //   size: 11pt,
  //   weight: "regular",
  //   style: "italic",
  //   it.body + [.],
  // )

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

      #block(height: 8.35cm)[
        #image("../imgs/unsaac_logo.png"),
      ]

      #text(1.23em)[
        UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO
      ]

      #v(1.3em)

      #text(1.23em)[
        PLAN DE TESIS
      ]

      #text(1.23em)[
        #line(length: 100%, stroke: 2.5pt)
        #smallcaps([*#titulo*])
        #line(length: 100%, stroke: 2.5pt)
      ]

      #v(2.3em)
      #text(1.1em)[
        #set par(justify: false)

        #grid(
          columns: 1,
          row-gutter: 1.5em,
          align: left,
          [
            Para optar al título profesional de: \
            #h(1em) #smallcaps(titulo-academico) \
          ],
          [
            Presentado Por: \
            #for autor in autores [
              #h(1em) #smallcaps(autor) \
            ]
          ],
          [
            #if asesor != none [
              Asesor: \
              #h(1em) #smallcaps(asesor) \
            ]
          ],
        )


      ]


      #v(1fr)
      #text(1.1em)[
        Perú,
        #if fecha != none [
          fecha
        ] else [
          #fecha_str(datetime.today())
        ]
      ]
      #v(1em)

      #text(0.91em, escuela)

      #text(0.78em, facultad)
    ]
  ]
  pagebreak()

  doc
}
