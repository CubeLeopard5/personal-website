// CV d'Adrien Michaud — mise en page sobre, une colonne.
//
//   typst compile --root . --input lang=fr cv/cv.typ fr/cv-adrien-michaud.pdf
//   typst compile --root . --input lang=en cv/cv.typ en/cv-adrien-michaud.pdf
//
// Le contenu vit dans data.typ, partage avec cv-canvas.typ.

#import "data.typ": *

#let d = DATA.at(lang)

#set document(title: "CV — Adrien Michaud", author: "Adrien Michaud")
#set page(paper: "a4", margin: (x: 15mm, y: 9mm))
#set text(font: "Segoe UI", size: 9pt, fill: BODY, lang: lang)
#set par(justify: false, leading: 0.64em, spacing: 6pt)
#set block(spacing: 5pt)

#let head(title) = block(spacing: 0pt, breakable: false)[
  #v(10.5pt)
  #text(size: 8.5pt, weight: 600, tracking: 1.3pt, fill: ACCENT, upper(title))
  #v(2.5pt)
  #line(length: 100%, stroke: 0.6pt + RULE)
  #v(5pt)
]

// ── En-tete ────────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, 30mm), column-gutter: 8mm, align: horizon,
  {
    text(size: 21pt, weight: 700, fill: INK, "Adrien Michaud")
    v(2pt)
    text(size: 11pt, weight: 600, fill: ACCENT, d.role)
    v(5pt)
    set text(size: 8.5pt, fill: MUTED)
    // Les liens passent en bleu : l'information statique reste grise,
    // l'information actionnable se distingue et signale qu'elle est cliquable.
    show link: set text(fill: ACCENT)
    stack(spacing: 3pt,
      d.place,
      [
        #link("mailto:michaudadrien78@gmail.com")[michaudadrien78\@gmail.com]
        · #link("https://www.linkedin.com/in/adrienmichaud/")[linkedin.com/in/adrienmichaud]
      ],
      link("https://www.michaud-developpement-informatique.fr/")[michaud-developpement-informatique.fr],
    )
  },
  box(clip: true, radius: 50%, width: 30mm, height: 30mm,
      image("/images/adrien-michaud.jpg", width: 30mm, height: 30mm, fit: "cover")),
)

#head(d.heads.profile)
#d.profile

// Les competences passent avant l'experience : un recruteur .NET cherche
// d'abord si la pile correspond, et cette reponse doit tenir dans le premier
// tiers de la page.
#head(d.heads.skills)
#for (label, items) in d.skills {
  grid(columns: (34mm, 1fr), column-gutter: 4mm,
    text(weight: 600, fill: INK, label),
    items,
  )
  v(2.5pt)
}
#grid(columns: (34mm, 1fr), column-gutter: 4mm,
  text(weight: 600, fill: INK, d.heads.langs),
  d.langs.map(l => l.at(0) + " (" + l.at(1) + ")").join(" · "),
)

#head(d.heads.xp)
// Une entree ne se coupe jamais entre deux pages : un intitule de poste
// orphelin en bas de page est le defaut le plus visible d'un CV.
#for j in d.jobs {
  block(breakable: false, spacing: 9.5pt, {
    grid(columns: (1fr, auto),
      { text(size: 10.5pt, weight: 600, fill: INK, j.org)
        text(size: 10pt, fill: BODY, " · " + j.role) },
      text(size: 8.5pt, fill: MUTED, j.dates),
    )
    v(1pt)
    text(size: 8.5pt, fill: MUTED, j.place)
    v(3pt)
    j.lead
    if j.bullets.len() > 0 {
      v(2pt)
      for b in j.bullets { block(inset: (left: 9pt), spacing: 4.5pt, [• #b]) }
    }
    if j.tech != "" {
      v(2pt)
      text(size: 8.5pt, fill: MUTED, j.tech)
    }
  })
}

#head(d.heads.edu)
#for e in d.edu {
  block(breakable: false, spacing: 9.5pt, {
    grid(columns: (1fr, auto),
      text(size: 10.5pt, weight: 600, fill: INK, e.org),
      text(size: 8.5pt, fill: MUTED, e.dates),
    )
    v(1pt)
    text(size: 8.5pt, fill: MUTED, e.place)
    v(3pt)
    e.detail
  })
}

#head(d.heads.other)
#for o in d.other {
  block(breakable: false, spacing: 9.5pt, {
    grid(columns: (1fr, auto),
      { text(size: 10.5pt, weight: 600, fill: INK, o.org)
        text(size: 10pt, fill: BODY, " · " + o.role) },
      text(size: 8.5pt, fill: MUTED, o.dates),
    )
    v(1pt)
    text(size: 8.5pt, fill: MUTED, o.place)
    v(3pt)
    o.lead
  })
}

