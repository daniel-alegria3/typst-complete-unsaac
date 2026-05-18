#import "@preview/gantty:0.5.1": gantt
#import "practicas-utils.typ": (
  activity_end_date, activity_start_date, calc_total_hours, get_period_end, get_period_end_str,
  normalize_activity,
)

#let DATE_FMT_STR = "[day]/[month]/[year]"

#let _activities = state("activities", none)
#let _period_start = state("period_start", none)
#let _hours_per_day = state("hours_per_day", none)

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
        image("../imgs/unsaac_logo.png", height: h),
        middle,
        image("../imgs/facultad_logo.png", height: h),
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

#let doc-practica-plan-actividades(
  title: none,
  author: none,
  id: none,
  field: none,
  period_start: none,
  schedule: none,
  company: none,
  company_manager: none,
  advisor: none,
  activities: none,
  hours_per_day: 6,
  exclude_weekends: true,
  exclude_holidays: true,
  doc,
) = {
  assert(type(period_start) == datetime, message: "'period_start' must be a datetime")
  _activities.update(activities.map(act => normalize_activity(act, hours_per_day)))
  _hours_per_day.update(hours_per_day)
  _period_start.update(period_start)

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
    period: get_period_end_str(period_start, hours_per_day, activities),
    schedule: schedule,
    hours: calc_total_hours(activities),
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

#let doc-practica-informe-parcial(
  title: none,
  author: none,
  id: none,
  field: none,
  period_start: none,
  schedule: none,
  company: none,
  company_manager: none,
  advisor: none,
  activities: none,
  hours_per_day: 6,
  exclude_weekends: true,
  exclude_holidays: true,
  doc,
) = {
  assert(type(period_start) == datetime, message: "'period_start' must be a datetime")
  _activities.update(activities.map(act => normalize_activity(act, hours_per_day)))
  _hours_per_day.update(hours_per_day)
  _period_start.update(period_start)

  let margin = 1.5cm
  let binding_margin = 2%

  set page(
    paper: "a4",
    margin: (
      rest: 1.5cm,
      left: margin + binding_margin,
      // inside: margin + binding_margin,
      // outside: margin - binding_margin,
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
    period: get_period_end_str(period_start, hours_per_day, activities),
    hours: calc_total_hours(activities),
  )

  doc

  v(1fr)
  _signature_block(
    advisor: advisor,
  )
  v(1fr)
}

#let print-activities-table(activities: none) = {
  context {
    let acts = if activities != none { activities } else { _activities.get() }
    if acts == none or acts.len() == 0 { return }

    let tcolors = (
      header_bg: rgb("#1f4e79"),
      header_fg: white,
      odd_row: luma(245),
      even_row: none,
    )

    let cum = 0
    let rows = ()
    for (idx, act) in acts.enumerate(start: 1) {
      let start = activity_start_date(_period_start.get(), _hours_per_day.get(), cum)
      cum += act.at("duracion", default: 0)
      let end = activity_end_date(_period_start.get(), _hours_per_day.get(), cum)
      rows.push((
        [#idx],
        act.at("nombre", default: none),
        act.at("parrafo", default: none),
        [#start.display(DATE_FMT_STR)],
        [#end.display(DATE_FMT_STR)],
      ))
    }

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
      ..rows.flatten(),
    )
  }
}

#let print-activities-detailed(activities: none) = {
  context {
    let acts = if activities != none { activities } else { _activities.get() }
    if acts == none or acts.len() == 0 { return }

    let cum = 0
    for act in acts {
      let activity = act.at("nombre", default: none)
      let details = act.at("parrafo", default: none)

      if activity == none { continue }

      let start = activity_start_date(_period_start.get(), _hours_per_day.get(), cum)
      cum += act.at("duracion", default: 0)
      let end = activity_end_date(_period_start.get(), _hours_per_day.get(), cum)

      [
        + *#activity* \ #h(1fr) (#start.display(DATE_FMT_STR) - #end.display(DATE_FMT_STR)) \
          #if details != none { details }
          #v(1em)
      ]
    }
  }
}

#let print-activities-gantt(activities: none) = {
  context {
    let acts = if activities != none { activities } else { _activities.get() }
    if acts == none or acts.len() == 0 { return }

    let gantt_chart = (
      tasks: acts
        .enumerate()
        .map(((act_i, act)) => (
          name: [#act.nombre],
          subtasks: act
            .lista
            .enumerate()
            .map(((i, st)) => {
              let hours = (
                acts.slice(0, act_i).fold(0, (acc, x) => acc + x.at("duracion", default: 0))
                  + act.lista.slice(0, i).fold(0, (acc, x) => acc + x.at("duracion", default: 0))
              )
              let start = activity_start_date(_period_start.get(), _hours_per_day.get(), hours)
              hours += st.at("duracion", default: 0)
              let end = activity_end_date(_period_start.get(), _hours_per_day.get(), hours)

              // hack to get a one day task displayed on the gantt
              let end = if st.at("duracion", default: 0) <= _hours_per_day.get() {
                end + duration(days: 1)
              } else {
                end
              }

              (
                name: st.at("nombre", default: none),
                start: start,
                end: end,
                // done: end,
              )
            }),
        )),
    )

    [
      #set text(size: 0.70em)
      #gantt(gantt_chart)
    ]
  }
}
