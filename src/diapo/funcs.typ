#import "@preview/touying:0.7.3": *
/// TODO: dont just use metropolis
#import themes.metropolis: *

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
          set image(height: 30%)
          block[
            #grid(
              columns: (2fr, 9fr, 2fr),
              image("../../imgs/unsaac_logo.png"),
              [
                #if info.institution != none { info.institution }

                #if info.faculty != none { info.faculty }

                #if info.school != none { info.school }
              ],
              image("../../imgs/facultad_logo.png"),
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
        if info.course != none {
          block(spacing: 1em)[
            #smallcaps([Curso]): #h(1em) #info.course
          ]
        }

        if info.professor != none {
          block(spacing: 1em)[
            #smallcaps([Docente]): #h(1em) #info.professor
          ]
        }

        if info.authors != none {
          block(spacing: 1em)[

            #if info.authors.len() > 1 [
              #set par(spacing: 0.75em)
              #smallcaps([Integrantes]):
              #grid(
                align: (left, left),
                columns: calc.ceil(info.authors.len() / 4),
                gutter: 3pt,
                inset: (
                  y: 2pt,
                ),
                ..info.authors.map(author => [
                  #h(0.5em) - #author.name #h(1em) (#author.id) #h(2em)
                ])
              )
            ] else if info.authors.len() == 1 [
              #let (name, id) = info.authors.at(0)
              #smallcaps([Alumno]): #h(1em) #name (#id)
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
