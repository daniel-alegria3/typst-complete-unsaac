#let curr_hours = state("curr_hours", 0)

#let _period_start = state("_period_start", none)
#let _hours_per_day = state("_hours_per_day", none)

#let date_fmt_str = "[day]/[month]/[year]"
#let skip_days = (6, 7)

#let hd(day, month) = datetime(year: datetime.today().year(), month: month, day: day)

#let months = (
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

#let get_month(date) = months.at(date.month() - 1)

#let holidays = (
  hd(1, 1), // Año Nuevo
  hd(2, 4), // Jueves Santo
  hd(3, 4), // Viernes Santo
  hd(1, 5), // Día del Trabajo
  hd(7, 6), // Batalla de Arica / Día de la Bandera
  hd(29, 6), // San Pedro y San Pablo
  hd(23, 7), // Día de la Fuerza Aérea
  hd(28, 7), // Fiestas Patrias
  hd(29, 7), // Fiestas Patrias
  hd(6, 8), // Batalla de Junín
  hd(30, 8), // Santa Rosa de Lima
  hd(8, 10), // Combate de Angamos
  hd(1, 11), // Día de Todos los Santos
  hd(8, 12), // Inmaculada Concepción
  hd(9, 12), // Batalla de Ayacucho
  hd(25, 12), // Navidad
)

#let inc_day(date) = {
  date + duration(days: 1)
}

#let dec_day(date) = {
  date - duration(days: 1)
}

#let next_working_day(date) = {
  let new_date = inc_day(date)
  while holidays.contains(new_date) or skip_days.contains(new_date.weekday()) {
    new_date = inc_day(new_date)
  }
  new_date
}

#let prev_working_day(date) = {
  let new_date = dec_day(date)
  while holidays.contains(new_date) or skip_days.contains(new_date.weekday()) {
    new_date = dec_day(new_date)
  }
  new_date
}

#let end_of_working_day(n, period_start, hours_per_day) = {
  if n <= hours_per_day and not (holidays.contains(period_start) or skip_days.contains(period_start.weekday())) {
    return period_start
  }
  let days_needed = calc.ceil(calc.quo(n, hours_per_day))
  let date = period_start
  let days_counted = 0
  while days_counted < days_needed {
    date = next_working_day(date)
    days_counted += 1
  }
  prev_working_day(date)
}

#let set_practice_params(period_start, hours_per_day) = {
  _period_start.update(p => period_start)
  _hours_per_day.update(h => hours_per_day)
}

#let total_hours() = {
  context { curr_hours.final() }
}

#let activity_start_date() = {
  context {
    let period_start = _period_start.get()
    let h = curr_hours.get()
    if h == 0 {
      period_start.display(date_fmt_str)
    } else {
      next_working_day(end_of_working_day(h, period_start, _hours_per_day.get())).display(date_fmt_str)
    }
  }
}

#let activity_end_date(hours) = {
  curr_hours.update(h => h + hours)
  context {
    end_of_working_day(curr_hours.get(), _period_start.get(), _hours_per_day.get()).display(date_fmt_str)
  }
}

#let final_period() = {
  context {
    let period_start = _period_start.get()
    let final_date = end_of_working_day(curr_hours.final(), period_start, _hours_per_day.get())
    (
      period_start.display("[day] de " + str(get_month(period_start)) + " de [year]")
        + " - "
        + final_date.display(
          "[day] de " + str(get_month(final_date)) + " de [year]",
        )
    )
  }
}

