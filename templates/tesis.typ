#import "@local/unsaac-docs:0.2.1": doc-tesis, src-block, src-file

#show: doc-tesis.with(
  titulo: [Titulo del trabajo de Tesis],
  asesor: [Nombre completo Asesor],
  autores: (
    "Nombre Completo Autor 1",
    "Nombre Completo Autor 2",
  ),
  titulo-documento: [PLAN DE TESIS],
  facultad: [Ingeniero Informático y de Sistemas],
  escuela: [FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA],
  titulo-academico: [Ingeniero Informático y de Sistemas],
  // duplex: true,
  // binding-margin: 2%,
)

#outline(title: "Tabla de Contenido")
#pagebreak()

= Resumen
#lorem(50)
