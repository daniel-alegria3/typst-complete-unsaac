#let _loc_before(a, b) = {
  let pa = a.position()
  let pb = b.position()
  pa.page < pb.page or (pa.page == pb.page and pa.y < pb.y)
}

#let _THM_KINDS = ("Definición", "Teorema", "Corolario")

#let _local_n(key, loc) = {
  let last_sub = query(heading.where(level: 1).or(heading.where(level: 2))).filter(h => _loc_before(
    h.location(),
    loc,
  ))
  if last_sub.len() == 0 {
    counter(key).at(loc).first()
  } else {
    counter(key).at(loc).first() - counter(key).at(last_sub.last().location()).first() + 1
  }
}

#let _section_tag(loc) = {
  let h = counter(heading).at(loc)
  str(h.at(0, default: 0)) + "." + str(h.at(1, default: 0))
}

#let _thm_block(thm_kind, body) = figure(
  kind: thm_kind,
  supplement: [#thm_kind],
  caption: none,
  numbering: _ => "",
  block(spacing: 1em, breakable: false, context {
    counter("thm-" + thm_kind).step()
    let loc = here()
    let tag = _section_tag(loc) + "." + str(_local_n("thm-" + thm_kind, loc))
    [*#thm_kind #tag.* #body]
  }),
)

#let definicion(body) = _thm_block("Definición", body)
#let teorema(body) = _thm_block("Teorema", body)
#let corolario(body) = _thm_block("Corolario", body)

#let sty-math(doc) = {
  show figure.where(kind: "Definición"): set align(left)
  show figure.where(kind: "Teorema"): set align(left)
  show figure.where(kind: "Corolario"): set align(left)

  set math.equation(numbering: "(1)")
  show math.equation.where(block: true): it => context {
    let loc = here()
    let tag = "(" + _section_tag(loc) + "." + str(_local_n("equation", loc)) + ")"
    grid(
      columns: (1fr, auto),
      align: (center, right),
      it.body, tag,
    )
  }
  show ref: it => {
    let el = it.element
    if el == none { return it }
    context {
      let loc = el.location()
      let prefix = _section_tag(loc)
      if el.func() == math.equation {
        link(loc)[Ecuación (#prefix.#str(_local_n("equation", loc)))]
      } else if el.func() == figure and el.kind in _THM_KINDS {
        link(loc)[#el.kind #prefix.#str(_local_n("thm-" + el.kind, loc))]
      } else {
        it
      }
    }
  }
  doc
}
