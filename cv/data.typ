// Contenu du CV — source unique, partagee par toutes les mises en page.
// Les deux langues vivent dans le meme dictionnaire : une section ajoutee
// d'un cote et oubliee de l'autre se voit a la lecture.

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
      contact: "Contact",
      xp: "Expérience",
      edu: "Formation",
      skills: "Compétences",
      langs: "Langues",
      other: "Autre",
    ),
    profile: [
      Je développe des applications web et mobiles en .NET pour des institutions
      publiques suisses — Blazor côté web, .NET MAUI côté mobile. J'ai construit le
      système d'inscription au vote électronique du canton de Neuchâtel
      (plus de 7~100 inscrits) ; j'assure la maintenance et l'amélioration de l'application
      GuMobile (≈~35~000 téléchargements) et de la plateforme FreeWifi, plusieurs
      milliers de connexions sur environ 300 points d'accès.
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
           plus de 7~100 inscriptions depuis l'ouverture en juin 2026.],
          [Plateforme de signalement du harcèlement de rue, livrée pour la Police
           neuchâteloise.],
          [Connexion SwissID et AGOV dans l'application mobile Guichet Unique
           (≈~35~000 téléchargements), via un serveur de fédération d'identité
           OpenID Connect.],
          [Plateforme de jurisprudence du TAS/CAS en .NET et Angular ;
           expérimentations de gouvernance blockchain avec NEDAO.],
        ),
        tech: "C# · .NET · Blazor · MAUI · Angular · PHP · SQL Server · TeamCity · Fastlane",
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
    // Meme forme qu'une entree de `jobs` : les deux mises en page les rendent
    // avec le meme code.
    other: (
      (
        org: "ESN Neuchâtel", role: "Membre actif (bénévolat)", place: "Neuchâtel, Suisse",
        dates: "Septembre 2024 — aujourd'hui",
        lead: [J'aide les étudiants internationaux à trouver leurs repères en Suisse :
               organisation d'événements et appui sur le côté pratique d'une
               installation à l'étranger.],
        bullets: (), tech: "",
      ),
    ),
    skills: (
      ("Écosystème .NET", "C# · .NET Framework · Blazor · MAUI · ASP.NET Core"),
      ("Front-end", "Angular · Vue.js · TypeScript · JavaScript"),
      ("Données", "Microsoft SQL Server · MySQL"),
      ("DevOps & outils", "TeamCity · Git / SVN · IIS"),
      ("Autres", "Node.js · PHP · C / C++ · Blockchain"),
    ),
    langs: (("Français", "langue maternelle"), ("Anglais", "niveau professionnel")),
  ),

  en: (
    role: ".NET & Full Stack Developer",
    place: "Neuchâtel, Switzerland",
    heads: (
      profile: "Profile",
      contact: "Contact",
      xp: "Experience",
      edu: "Education",
      skills: "Skills",
      langs: "Languages",
      other: "Other",
    ),
    profile: [
      I build web and mobile applications in .NET for Swiss public institutions —
      Blazor on the web, .NET MAUI on mobile. I built the registration system for the
      canton of Neuchâtel's electronic voting (more than 7,100 registrations); I maintain and
      improve the GuMobile app (≈~35,000 downloads) and the FreeWifi platform,
      several thousand connections across some 300 access points.
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
          [Street harassment reporting platform, delivered for the Neuchâtel Police.],
          [SwissID and AGOV sign-in in the Guichet Unique mobile app (≈~35,000
           downloads), through an OpenID Connect identity federation server.],
          [TAS/CAS jurisprudence platform in .NET and Angular; blockchain governance
           experiments with NEDAO.],
        ),
        tech: "C# · .NET · Blazor · MAUI · Angular · PHP · SQL Server · TeamCity · Fastlane",
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
    other: (
      (
        org: "ESN Neuchâtel", role: "Active member (volunteer)", place: "Neuchâtel, Switzerland",
        dates: "September 2024 — present",
        lead: [I help international students find their feet in Switzerland:
               organising events, and lending a hand with the practical side of
               moving to a new country.],
        bullets: (), tech: "",
      ),
    ),
    skills: (
      (".NET ecosystem", "C# · .NET Framework · Blazor · MAUI · ASP.NET Core"),
      ("Front-end", "Angular · Vue.js · TypeScript · JavaScript"),
      ("Data", "Microsoft SQL Server · MySQL"),
      ("DevOps & tooling", "TeamCity · Git / SVN · IIS"),
      ("Other", "Node.js · PHP · C / C++ · Blockchain"),
    ),
    langs: (("French", "native"), ("English", "professional working proficiency")),
  ),
)

