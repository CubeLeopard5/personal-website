// CV d'Adrien Michaud — mise en page a colonne laterale.
//
//   typst compile --root . --input lang=fr cv/cv-canvas.typ <sortie.pdf>
//
// Meme contenu que cv.typ : les deux importent data.typ.
// La bande porte le degrade du hero du site, assombri pour que le blanc
// reste lisible dessus (le #667eea d'origine ne donne que 3,6:1).

#import "data.typ": *

#let d = DATA.at(lang)

#let BAND_TOP = rgb("#4c46b6")
#let BAND_BOT = rgb("#6b3d8c")
#let ON_BAND  = rgb("#ffffff")
#let ON_BAND_SOFT = rgb("#dcd9f2")

#let SIDE = 64mm

// Un seul ecart entre deux entrees de la bande, quelle que soit la section :
// contact, competences et langues le partagent pour ne pas diverger.
#let SIDE_GAP = 22pt

#set document(title: "CV — Adrien Michaud", author: "Adrien Michaud")
#set page(
  paper: "a4", margin: 0pt,
  // Le fond garantit que la bande descend jusqu'au bord meme si son
  // contenu est plus court que la colonne de droite.
  background: place(left + top,
    rect(width: SIDE, height: 100%,
         fill: gradient.linear(BAND_TOP, BAND_BOT, angle: 90deg))),
)
#set text(font: "Segoe UI", size: 9.5pt, fill: BODY, lang: lang)
#set par(justify: false, leading: 0.68em, spacing: 6pt)
#set block(spacing: 5pt)

// ── Intitules de section ───────────────────────────────────────────────────
#let side-head(title) = block(spacing: 0pt, breakable: false)[
  #v(16pt)
  #text(size: 7.5pt, weight: 600, tracking: 1.2pt, fill: ON_BAND, upper(title))
  #v(2.5pt)
  #line(length: 100%, stroke: 0.6pt + ON_BAND_SOFT)
  #v(5pt)
]

#let main-head(title) = block(spacing: 0pt, breakable: false)[
  #v(15pt)
  #text(size: 8.5pt, weight: 600, tracking: 1.3pt, fill: ACCENT, upper(title))
  #v(2.5pt)
  #line(length: 100%, stroke: 0.6pt + RULE)
  #v(5pt)
]

// ── Colonne laterale ───────────────────────────────────────────────────────
#let sidebar = {
  set text(fill: ON_BAND_SOFT, size: 8pt)
  set par(leading: 0.6em, spacing: 4pt)
  show link: set text(fill: ON_BAND)

  align(center,
    box(clip: true, radius: 50%, width: 34mm, height: 34mm,
        stroke: 2pt + ON_BAND,
        image("/images/adrien-michaud.jpg", width: 34mm, height: 34mm, fit: "cover")))

  side-head(d.heads.contact)
  stack(spacing: SIDE_GAP,
    text(fill: ON_BAND, d.place),
    link("mailto:michaudadrien78@gmail.com")[michaudadrien78\@gmail.com],
    link("https://www.linkedin.com/in/adrienmichaud/")[linkedin.com/in/adrienmichaud],
    link("https://www.michaud-developpement-informatique.fr/")[michaud-developpement-\ informatique.fr],
  )

  side-head(d.heads.skills)
  // Aere volontairement : la bande est plus courte que la colonne de droite,
  // l'espace gagne ici equilibre les deux colonnes.
  for (label, items) in d.skills {
    block(spacing: SIDE_GAP, {
      text(weight: 600, fill: ON_BAND, size: 8pt, label)
      // espace intra-entree : volontairement plus serre que SIDE_GAP, pour que
      // l'intitule reste visuellement attache a sa liste
      v(5pt)
      set par(leading: 0.95em)
      text(size: 7.8pt, items)
    })
  }

  side-head(d.heads.langs)
  set par(leading: 0.95em)
  stack(spacing: SIDE_GAP, ..d.langs.map(l =>
    text(size: 7.8pt)[#text(weight: 600, fill: ON_BAND, l.at(0)) — #l.at(1)]))
}

// ── Colonne principale ─────────────────────────────────────────────────────
#let main = {
  text(size: 22pt, weight: 700, fill: INK, "Adrien Michaud")
  v(2pt)
  text(size: 11.5pt, weight: 600, fill: ACCENT, d.role)

  main-head(d.heads.profile)
  d.profile

  main-head(d.heads.xp)
  for j in d.jobs {
    block(breakable: false, spacing: 13pt, {
      text(size: 11pt, weight: 600, fill: INK, j.org)
      text(size: 10.5pt, fill: BODY, " · " + j.role)
      linebreak()
      text(size: 8pt, fill: MUTED, j.dates + "  ·  " + j.place)
      v(3pt)
      j.lead
      if j.bullets.len() > 0 {
        v(2pt)
        for b in j.bullets { block(inset: (left: 9pt), spacing: 5pt, [• #b]) }
      }
      // j.tech n'est pas rendu ici : les technologies vivent dans la bande.
      // cv.typ les garde, lui — un ATS s'appuie sur ces mots-cles.
    })
  }

  main-head(d.heads.edu)
  for e in d.edu {
    block(breakable: false, spacing: 11pt, {
      text(size: 11pt, weight: 600, fill: INK, e.org)
      linebreak()
      text(size: 8pt, fill: MUTED, e.dates + "  ·  " + e.place)
      v(3pt)
      e.detail
    })
  }

  main-head(d.heads.other)
  for o in d.other {
    block(breakable: false, spacing: 11pt, {
      text(size: 11pt, weight: 600, fill: INK, o.org)
      text(size: 10.5pt, fill: BODY, " · " + o.role)
      linebreak()
      text(size: 8pt, fill: MUTED, o.dates + "  ·  " + o.place)
      v(3pt)
      o.lead
    })
  }
}

#grid(
  columns: (SIDE, 1fr),
  block(inset: (x: 8mm, top: 10mm, bottom: 8mm), sidebar),
  block(inset: (left: 9mm, right: 11mm, top: 11mm, bottom: 8mm), main),
)
