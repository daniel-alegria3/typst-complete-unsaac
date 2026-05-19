#import "@preview/touying:0.7.3": *
#import "./utils/fecha.typ": fecha_str

#import themes.metropolis: *
/// TODO: dont just use metropolis
/// - dewdrop: how to have its block style
/// - metropolis: its main vibe
/// - aqua: to learn to have background

#let doc-diapo(
  title: none,
  subtitle: none,
  course: none,
  professor: none,
  authors: (),
  date: none,
  doc,
) = {
  import "@preview/numbly:0.1.0": numbly

  show: metropolis-theme.with(
    aspect-ratio: "16-9", // NOTE: doesn't get overwritten by config-store()
    align: horizon,
    footer: self => self.info.title,
    config-info(
      title: title,
      subtitle: subtitle,
      course: course,
      professor: professor,
      authors: authors,
      date: [Perú, #if (date != none) { date } else { fecha_str(datetime.today()) }],
      institution: [UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO],
      faculty: [FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA],
      school: [ESCUELA PROFESIONAL DE INGENIERÍA INFORMÁTICA Y DE SISTEMAS],
      // logo: emoji.city,
    ),
    config-common(
      handout: false,
      slide-level: 1,
      new-section-slide-fn: none, // new-section-slide
      // show-notes-on-second-screen: right,
      // datetime-format: "[day]-[month]-[year]", // NOTE: do use this when language support for 'es'
    ),
    config-colors(
      primary: rgb("#eb811b"),
      primary-light: rgb("#d6c6b7"),
      secondary: rgb("#23373b"),
      neutral-lightest: rgb("#fafafa"),
      neutral-dark: rgb("#2f373b"),
      neutral-darkest: rgb("#23373b"),
    ),
    config-methods(
      cover: utils.color-changing-cover.with(transparentize-table: true),
    ),
    config-page(
      // margin: (x: 4em, y: 2em),
      // header-ascent: 0em,
      // footer-descent: 0em,
    ),
  )

  set heading(numbering: numbly("{1}.", default: "1.1"))

  doc
}

#let title-slide(
  config: (:),
  extra: none,
  ..args,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config,
    config-common(freeze-slide-counter: true),
    config-page(
      fill: self.colors.neutral-lightest,
      margin: (
        top: 1em,
        bottom: 1em,
        left: 2em,
        right: 2em,
      ),
    ),
  )
  let info = self.info + args.named()
  let body = {
    set text(fill: self.colors.neutral-darkest)
    set std.align(horizon)
    // context page.margin
    block(
      breakable: false,
      width: 100%,
      inset: 0.25em,
      {
        {
          set std.align(center + horizon)
          set text(size: 0.7em)
          set par(spacing: 1em)
          let image_params = (height: 30%, fit: "cover", width: auto, scaling: auto)
          block[
            #grid(
              columns: (2fr, 9fr, 2fr),
              image("../imgs/unsaac_logo.png", ..image_params),
              [
                #if info.institution != none { info.institution }

                #if info.faculty != none { info.faculty }

                #if info.school != none { info.school }
              ],
              image("../imgs/facultad_logo.png", ..image_params),
            )
          ]
        }

        // components.left-and-right(
        {
          set std.align(center + horizon)
          block(
            fill: self.colors.primary-light,
            inset: 1em,
            width: 100%,
            radius: 0.2em,
            text(size: 1.3em, fill: self.colors.secondary, text(
              weight: "medium",
              info.title,
            ))
              + (
                if info.subtitle != none {
                  linebreak()
                  text(size: 0.9em, fill: self.colors.secondary, info.subtitle)
                }
              ),
          )
        }
        //   ,text(2em, utils.call-or-display(self, info.logo)),
        // )

        line(length: 100%, stroke: .05em + self.colors.primary)

        set text(size: .8em)

        let sep = ":"
        let rows = ()
        if info.course != none { rows += (smallcaps[Curso], [#sep], [#info.course]) }
        if info.professor != none { rows += (smallcaps[Docente], [#sep], [#info.professor]) }
        if info.authors != none {
          if info.authors.len() > 1 {
            rows += (smallcaps[Integrantes], [#sep], [])
          } else if info.authors.len() == 1 {
            let (name, id) = info.authors.at(0)
            rows += (smallcaps[Alumno], [#sep], [#name (#id)])
          }
        }
        grid(
          columns: (auto, auto, auto),
          gutter: 0.80em,
          ..rows,
        )

        if info.authors != none {
          block(spacing: 1em)[

            #if info.authors.len() > 1 [
              #set par(spacing: 0.75em)
              #let cols = calc.ceil(info.authors.len() / 4)
              #pad(left: 1em)[
                #grid(
                  align: (left, left) * cols,
                  columns: cols * 2,
                  gutter: 3pt,
                  column-gutter: (0.8em, 2em) * cols,
                  inset: (
                    y: 2pt,
                  ),
                  ..info
                    .authors
                    .map(author => (
                      [- #author.name],
                      [(#author.id)],
                    ))
                    .flatten()
                )
              ]
            ]
          ]
        }

        v(1fr)

        if info.date != none {
          set std.align(right + horizon)
          block(spacing: 1em, utils.display-info-date(self))
        }

        if extra != none {
          set text(size: .8em)
          block(spacing: 1em, extra)
        }
      },
    )
  }
  touying-slide(self: self, body)
})
