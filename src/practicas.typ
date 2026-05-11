#import "fechas.typ": activity_end_date, activity_start_date, final_period, set_practice_params, total_hours

#let _caratula(
  title: none,
  author: none,
  id: none,
  advisor: none,
  company: none,
  boss: none,
  field: none,
  period: none,
  schedule: none,
  hours: none,
) = {
  place(
    float: true,
    auto,
    scope: "parent",
    clearance: 2em,
  )[
    #set par(first-line-indent: 0em, leading: 1em)
    #set text(size: 0.85em, weight: "bold")
    #layout(size => {
      let middle = [
        #text(1.55em)[_ #title _] \
        UNIVERSIDAD NACIONAL DE SAN ANTONIO ABAD DEL CUSCO \
        FACULTAD DE INGENIERÍA ELÉCTRICA, ELECTRÓNICA, INFORMÁTICA Y MECÁNICA \
        ESCUELA PROFESIONAL DE INGENIERÍA INFORMÁTICA Y DE SISTEMAS \
      ]
      let h = measure(middle, width: size.width * 4 / 6).height * 1.25
      grid(
        columns: (1fr, 4fr, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        image("../imgs/unsaac_logo.png", height: h), middle, image("../imgs/facultad_logo.png", height: h),
      )
    })
  ]

  let sep = ":"
  let rows = ()
  if author != none { rows += (smallcaps[- *Practicante*], [*#sep*], [#author]) }
  if id != none { rows += (smallcaps[- *Código*], [*#sep*], [#id]) }
  if advisor != none { rows += (smallcaps[- *Asesor*], [*#sep*], [#advisor]) }
  if company != none { rows += (smallcaps[- *Empresa*], [*#sep*], [#company]) }
  if boss != none { rows += (smallcaps[- *Jefe Inmediato*], [*#sep*], [#boss]) }
  if field != none { rows += (smallcaps[- *Área*], [*#sep*], [#field]) }
  if period != none { rows += (smallcaps[- *Período*], [*#sep*], [#period]) }
  if schedule != none { rows += (smallcaps[- *Horario*], [*#sep*], [#schedule]) }
  if hours != none { rows += (smallcaps[- *Total de horas*], [*#sep*], [#hours]) }
  grid(
    columns: (auto, auto, auto),
    gutter: 1em,
    ..rows,
  )
}

#let _signature_block(
  company_manager: none,
  author: none,
  advisor: none,
) = {
  let rows = ()
  if company_manager != none {
    rows.push((key: smallcaps[*Encargado del\ lugar de prácticas*], value: [#company_manager]))
  }
  if author != none { rows.push((key: smallcaps[*Alumno Practicante*], value: [#author])) }
  if advisor != none { rows.push((key: smallcaps[*Docente Asesor*], value: [#advisor])) }
  block(
    breakable: false,
    grid(
      columns: rows.map(_ => 1fr),
      gutter: 0.5em,
      align: center + horizon,
      ..rows.map(_ => [#v(3em)]),
      ..rows.map(_ => [#box(width: 5cm, baseline: 5pt, stroke: (bottom: 0.5pt + luma(150)))]),
      ..rows.map(r => [#r.key]),
      ..rows.map(r => [#r.value]),
    ),
  )
}

#let print_activities_table(activities) = {
  if activities == none or activities.len() == 0 { return }

  let tcolors = (
    header_bg: rgb("#1f4e79"),
    header_fg: white,
    odd_row: luma(245),
    even_row: none,
  )

  if activities.len() >= 1 {
    table(
      columns: (auto, 2fr, 4fr, auto, auto),
      align: (center, left, left, center, center),
      fill: (x, y) => if calc.odd(y) {
        tcolors.odd_row
      } else {
        tcolors.even_row
      },
      table.header(
        table.cell(fill: tcolors.header_bg, text(fill: tcolors.header_fg)[Nro]),
        table.cell(fill: tcolors.header_bg, text(fill: tcolors.header_fg)[Actividad]),
        table.cell(fill: tcolors.header_bg, text(fill: tcolors.header_fg)[Descripción]),
        table.cell(fill: tcolors.header_bg, text(fill: tcolors.header_fg)[Fecha Inicio]),
        table.cell(fill: tcolors.header_bg, text(fill: tcolors.header_fg)[Fecha Fin]),
      ),
      ..activities
        .enumerate(start: 1)
        .map(((idx, act)) => (
          [#idx],
          act.at("activity", default: none),
          act.at("description", default: none),
          [#activity_start_date()],
          [#activity_end_date(act.at("duration", default: 0))],
        ))
        .flatten(),
    )
  }
}

#let print_activities_detailed(activities) = {
  if activities == none or activities.len() == 0 { return }

  for act in activities {
    let activity = act.at("activity", default: none)
    let details = act.at("details", default: none)
    let duration = act.at("duration", default: 0)

    if activity == none { continue }

    let start = activity_start_date()
    let end = activity_end_date(duration)

    [
      + *#activity* \ #h(1fr) (#start - #end) \
        #if details != none { details }
        #v(1em)
    ]
  }
}

#let practica_plan_actividades(
  title: none,
  author: none,
  id: none,
  field: none,
  period_start: none,
  schedule: none,
  company: none,
  company_manager: none,
  advisor: none,
  hours_per_day: 6,
  exclude_weekends: true,
  exclude_holidays: true,
  doc,
) = {
  assert(type(period_start) == datetime, message: "'period_start' must be a datetime")
  set_practice_params(period_start, hours_per_day)

  set page(
    paper: "a4",
    flipped: true,
    margin: (
      rest: 1.5cm,
      top: 1.5cm + 3%,
    ),
  )
  set text(
    font: "TeX Gyre Termes",
    size: 11pt,
    spacing: 0.35em,
    lang: "es",
    region: "pe",
  )
  set par(
    first-line-indent: 1.2em,
    leading: 0.65em,
    justify: true,
  )
  set heading(
    numbering: "1.",
  )

  show heading.where(
    level: 1,
  ): set block(below: 1em)

  set list(
    indent: 1.2em,
    spacing: 0.85em,
  )

  _caratula(
    title: title,
    author: author,
    id: id,
    company: company,
    field: field,
    period: final_period(),
    schedule: schedule,
    hours: total_hours(),
  )

  doc

  v(1fr)
  _signature_block(
    company_manager: company_manager,
    author: author,
    advisor: advisor,
  )
  v(1fr)
}

#let practica_informe_parcial(
  title: none,
  author: none,
  id: none,
  field: none,
  period_start: none,
  schedule: none,
  company: none,
  company_manager: none,
  advisor: none,
  hours_per_day: 6,
  exclude_weekends: true,
  exclude_holidays: true,
  doc,
) = {
  assert(type(period_start) == datetime, message: "'period_start' must be a datetime")
  set_practice_params(period_start, hours_per_day)

  let margin = 1.5cm
  let margin_side_ratio = 2%

  set page(
    paper: "a4",
    margin: (
      rest: 1.5cm,
      left: margin + margin_side_ratio,
      // inside: margin + margin_side_ratio,
      // outside: margin - margin_side_ratio,
    ),
  )
  set text(
    font: "TeX Gyre Termes",
    size: 11pt,
    spacing: 0.35em,
    lang: "es",
    region: "pe",
  )
  set par(
    first-line-indent: 1.2em,
    leading: 0.65em,
    justify: true,
  )
  set heading(
    numbering: "1.",
  )

  show heading.where(
    level: 1,
  ): set block(below: 1em)

  set list(
    indent: 1.2em,
    spacing: 0.85em,
  )
  set enum(
    indent: 1.2em,
    spacing: 0.85em,
  )
  // TODO: https://discord.com/channels/1054443721975922748/1388236879115321404
  set enum(
    full: true,
    numbering: (..args) => {
      let nums = args.pos()
      let style_per_level = ("1.", "a)", "(i)")
      numbering(
        style_per_level.at(nums.len() - 1, default: "1."),
        nums.at(nums.len() - 1),
      )
    },
  )

  _caratula(
    title: title,
    author: author,
    id: id,
    advisor: advisor,
    company: company,
    boss: company_manager,
    field: field,
    period: final_period(),
    hours: total_hours(),
  )

  doc

  v(1fr)
  _signature_block(
    advisor: advisor,
  )
  v(1fr)
}

