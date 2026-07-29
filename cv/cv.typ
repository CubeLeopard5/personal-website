// CV d'Adrien Michaud — un seul gabarit, deux langues.
//
//   typst compile --input lang=fr cv.typ ../fr/cv-adrien-michaud.pdf
//   typst compile --input lang=en cv.typ ../en/cv-adrien-michaud.pdf
//
// Le contenu des deux langues vit dans le meme dictionnaire : une section
// ajoutee d'un cote sans l'autre se voit immediatement a la lecture.
// Les couleurs et la police reprennent celles du site.

#let INK    = rgb("#1e293b")
#let BODY   = rgb("#475569")
#let MUTED  = rgb("#64748b")
#let ACCENT = rgb("#2563eb")
#let RULE   = rgb("#cbd5e1")

#let lang = sys.inputs.at("lang", default: "fr")

#let DATA = (
  fr: (
    role: "Développeur .NET & Full Stack",
    place: "Neuchâtel, Suisse",
    heads: (
      profile: "Profil",
      xp: "Expérience",
      edu: "Formation",
      skills: "Compétences",
      langs: "Langues",
    ),
    profile: [
      Je développe des applications web et mobiles *en .NET* pour des institutions
      publiques suisses — Blazor côté web, .NET MAUI côté mobile. Un domaine où le
      logiciel doit fonctionner pour tout le monde et résister à un examen extérieur :
      j'ai construit les services d'inscription des citoyens pour la plateforme de
      vote électronique du canton de Neuchâtel, où le droit fédéral n'autorise que
      les systèmes entièrement vérifiables.
    ],
    jobs: (
      (
        org: "Arcantel SA", role: "Développeur logiciel", place: "Neuchâtel, Suisse",
        dates: "Mars 2024 — aujourd'hui",
        lead: [Applications web et mobiles pour le Service informatique de l'entité
               neuchâteloise (SIEN), l'entreprise de transports TransN et le Tribunal
               Arbitral du Sport.],
        bullets: (
          [Services d'inscription des citoyens au vote électronique cantonal —
           plus de 7 100 inscriptions depuis l'ouverture en juin 2026.],
          [Plateforme de signalement du harcèlement de rue, livrée avec la Police
           neuchâteloise.],
          [Connexion SwissID et AGOV dans l'application mobile Guichet Unique, via
           un serveur de fédération d'identité OpenID Connect.],
          [Plateforme de jurisprudence du TAS/CAS en .NET et Angular ;
           expérimentations de gouvernance blockchain avec NEDAO.],
        ),
        tech: "C# · .NET · Blazor · MAUI · Angular · PHP · SQL Server · TeamCity · Fastlane",
      ),
      (
        org: "ESN Neuchâtel", role: "Membre actif (bénévolat)", place: "Neuchâtel, Suisse",
        dates: "Septembre 2024 — aujourd'hui",
        lead: [J'aide les étudiants internationaux à trouver leurs repères en Suisse :
               organisation d'événements et appui sur le côté pratique d'une
               installation à l'étranger.],
        bullets: (), tech: "",
      ),
      (
        org: "ESPRI Digital", role: "Développeur back-end (stage)", place: "Argentan, France",
        dates: "Avril — juillet 2022",
        lead: [Service de sauvegarde de bases de données pour des charges
               conteneurisées tournant sur Kubernetes.],
        bullets: (), tech: "Kubernetes · Docker · Node.js",
      ),
      (
        org: "Axxone System", role: "Développeur full stack (deux stages)", place: "Lyon, France",
        dates: "2020 — 2022",
        lead: [Juillet–décembre 2020 : composants Vue.js et recherche plein texte sur
               Elasticsearch. Septembre 2021 – mars 2022 : refonte du site de la
               Mutuelle Générale de Prévoyance en Vue.js et reprise d'une partie de
               son API PHP.],
        bullets: (), tech: "Vue.js · Elasticsearch · PHP",
      ),
    ),
    edu: (
      (org: "EPITECH — European Institute of Technology", place: "France",
       dates: "Septembre 2019 — août 2024",
       detail: [Expert en technologies de l'information, développement logiciel.
                Programme Grande École, cursus de cinq ans.]),
      (org: "Dublin City University", place: "Dublin, Irlande",
       dates: "Septembre 2022 — mai 2023",
       detail: [Faculty of Engineering and Computing. Quatrième année d'études
                effectuée en échange.]),
    ),
    skills: (
      ("Écosystème .NET", "C# · .NET Framework · Blazor · MAUI · ASP.NET Core"),
      ("Architecture", "Clean Architecture · MediatR · API REST · normes eCH"),
      ("Mobile", "iOS · Android · Fastlane"),
      ("Front-end", "Angular · Vue.js · TypeScript · JavaScript"),
      ("Données", "Microsoft SQL Server · MySQL · Elasticsearch"),
      ("DevOps & outils", "TeamCity · Git / SVN · IIS · Docker · Kubernetes"),
      ("Autres", "Node.js · PHP · C / C++ · Blockchain"),
    ),
    langs: (("Français", "langue maternelle"), ("Anglais", "niveau professionnel")),
  ),

  en: (
    role: ".NET & Full Stack Developer",
    place: "Neuchâtel, Switzerland",
    heads: (
      profile: "Profile",
      xp: "Experience",
      edu: "Education",
      skills: "Skills",
      langs: "Languages",
    ),
    profile: [
      I build web and mobile applications *in .NET* for Swiss public institutions —
      Blazor on the web, .NET MAUI on mobile. A domain where software has to work for
      everyone and hold up to outside scrutiny: I built the citizen registration
      services for the canton of Neuchâtel's e-voting platform, where federal law
      permits only fully verifiable systems.
    ],
    jobs: (
      (
        org: "Arcantel SA", role: "Software Developer", place: "Neuchâtel, Switzerland",
        dates: "March 2024 — present",
        lead: [Web and mobile applications for the Neuchâtel public IT service
               (SIEN), the public transport operator TransN and the Court of
               Arbitration for Sport.],
        bullets: (
          [Citizen registration services for cantonal electronic voting — more than
           7,100 registrations since they opened in June 2026.],
          [Street harassment reporting platform, delivered with the Neuchâtel Police.],
          [SwissID and AGOV sign-in in the Guichet Unique mobile app, through an
           OpenID Connect identity federation server.],
          [TAS/CAS jurisprudence platform in .NET and Angular; blockchain governance
           experiments with NEDAO.],
        ),
        tech: "C# · .NET · Blazor · MAUI · Angular · PHP · SQL Server · TeamCity · Fastlane",
      ),
      (
        org: "ESN Neuchâtel", role: "Active member (volunteer)", place: "Neuchâtel, Switzerland",
        dates: "September 2024 — present",
        lead: [I help international students find their feet in Switzerland:
               organising events, and lending a hand with the practical side of
               moving to a new country.],
        bullets: (), tech: "",
      ),
      (
        org: "ESPRI Digital", role: "Back End Developer (internship)", place: "Argentan, France",
        dates: "April — July 2022",
        lead: [A database backup service for containerised workloads running on
               Kubernetes.],
        bullets: (), tech: "Kubernetes · Docker · Node.js",
      ),
      (
        org: "Axxone System", role: "Full Stack Developer (two internships)", place: "Lyon, France",
        dates: "2020 — 2022",
        lead: [July–December 2020: Vue.js components and a full-text search over
               Elasticsearch. September 2021 – March 2022: redesign of the Mutuelle
               Générale de Prévoyance site in Vue.js, and rework of parts of its
               PHP API.],
        bullets: (), tech: "Vue.js · Elasticsearch · PHP",
      ),
    ),
    edu: (
      (org: "EPITECH — European Institute of Technology", place: "France",
       dates: "September 2019 — August 2024",
       detail: [Expert in Information Technology, software development.
                Grande École programme, a five-year curriculum.]),
      (org: "Dublin City University", place: "Dublin, Ireland",
       dates: "September 2022 — May 2023",
       detail: [Faculty of Engineering and Computing. Fourth year of study,
                completed on exchange.]),
    ),
    skills: (
      (".NET ecosystem", "C# · .NET Framework · Blazor · MAUI · ASP.NET Core"),
      ("Architecture", "Clean Architecture · MediatR · REST APIs · eCH standards"),
      ("Mobile", "iOS · Android · Fastlane"),
      ("Front-end", "Angular · Vue.js · TypeScript · JavaScript"),
      ("Data", "Microsoft SQL Server · MySQL · Elasticsearch"),
      ("DevOps & tooling", "TeamCity · Git / SVN · IIS · Docker · Kubernetes"),
      ("Other", "Node.js · PHP · C / C++ · Blockchain"),
    ),
    langs: (("French", "native"), ("English", "professional working proficiency")),
  ),
)

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

