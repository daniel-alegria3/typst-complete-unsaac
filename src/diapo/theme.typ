#import "@preview/touying:0.7.3": *
/// TODO: dont just use metropolis
#import themes.metropolis: *

/// TODO:
/// - dewdrop: how to have its block style
/// - metropolis: its main vibe
/// - aqua: to learn to have background

#let fecha(date) = {
  // Temp fix for 'lang: es' not working on datetime()
  let months = (
    "Enero",
    "Febrero",
    "Marzo",
    "Abril",
    "Mayo",
    "Junio",
    "Julio",
    "Agosto",
    "Septiembre",
    "Octubre",
    "Noviembre",
    "Diciembre",
  )
  [#months.at(date.month() - 1) del #date.year()]
}

#import "funcs.typ": title-slide

/// show rule template
#let doc-diapo(
  title: none,
  subtitle: none,
  course: none,
  professor: none,
  authors: (),
  date: none,
  opts: (align: start),
  doc,
) = {
  // import diapo_funcs: *
  import "@preview/numbly:0.1.0": numbly

  show: metropolis-theme.with(
    aspect-ratio: "16-9",
    align: opts.align,
    footer: self => self.info.title,
    config-info(
      title: title,
      subtitle: subtitle,
      course: course,
      professor: professor,
      authors: authors,
      date: [Perú, #if (date != none) { date } else { fecha(datetime.today()) }],
      institution: [UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO],
      faculty: [FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA],
      school: [ESCUELA PROFESIONAL DE INGENIERÍA INFORMÁTICA Y DE SISTEMAS],
      // logo: emoji.city,
    ),
    config-common(
      datetime-format: "[day]-[month]-[year]",
      // TODO: these two, think how to config in touying-0.7.3
      slide-level: 1,
      new-section-slide-fn: none,
      // handout: true, // omit animations
      // show-notes-on-second-screen: right,
    ),
    config-page(
      // margin: (x: 4em, y: 2em),
      // header-ascent: 0em,
      // footer-descent: 0em,
    ),
    config-methods(cover: utils.semi-transparent-cover.with(alpha: 85%)),
    config-colors(
      primary: rgb("#eb811b"),
      primary-light: rgb("#d6c6b7"),
      secondary: rgb("#23373b"),
      neutral-lightest: rgb("#fafafa"),
      neutral-dark: rgb("#2f373b"),
      neutral-darkest: rgb("#23373b"),
    ),
  )

  set heading(numbering: numbly("{1}.", default: "1.1"))

  title-slide()

  doc
}
