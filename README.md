# michaud-developpement-informatique.fr

Personal portfolio. Static HTML/CSS/JS — no build step, no dependencies.
Deployed on Vercel; the file path *is* the URL.

## Structure

```
main.css  main.js          shared by every page
fonts/    inter-variable.woff2
images/   favicon.svg  og-image.png  adrien-michaud.jpg
images/projects/         card visuals — see "Project card visuals"
robots.txt  sitemap.xml  vercel.json

en/                        English site
  index.html
  blog/index.html          + one file per article
  blog/post-template.html.template
  projects/*.html
  privacy/rappel.html
fr/                        French site — same tree, mirrored
  index.html
  blog/index.html
  projects/*.html
  privacy/rappel.html
```

The two language trees are mirrors: a page at `en/<path>` has its counterpart
at `fr/<path>`. Every internal link inside a tree is relative, so the same
markup works in both. Only the shared assets need `../` for each level of
depth — one `../` from `en/index.html`, two from `en/blog/index.html`.

`/` does not serve a file. `vercel.json` redirects it to `/fr/` or `/en/`
depending on the visitor's `Accept-Language` header, with `/en/` as fallback.
That redirect is a **307, deliberately not a 301** — a permanent redirect would
be cached by the browser and lock a visitor into one language for good.

## Translation status

Both trees are fully translated — 9 pages each, all indexable, all listed in
`sitemap.xml`. No page carries a `noindex`.

When you add a page, keep the pair in step: a page that exists in only one
language breaks the mirror the `hreflang` alternates and the language switcher
both assume. If you must ship one side first, give the untranslated copy

```html
<meta name="robots" content="noindex">
```

and leave it out of `sitemap.xml` until its content matches its folder's
language. Set `<html lang="...">` to the language actually written on the page,
not the folder it sits in — a screen reader trusts that attribute.

## The CV

`cv/data.typ` holds the content — both languages in one `DATA` dictionary, so a
section added on one side and forgotten on the other is visible at a glance.
Two layouts read from it:

- `cv/cv-canvas.typ` — **the deployed one.** A tinted sidebar carrying the
  site's hero gradient, with photo, contact and skills in the band. The gradient
  is a darkened version of the site's: white on the original `#667eea` only
  reaches 3.6:1, below the threshold for body text.
- `cv/cv.typ` — single column, sober. Kept as a fallback: two-column layouts are
  the ones applicant tracking systems scramble, so if you ever apply through a
  large portal rather than to a person, send this one.

Edit content in `data.typ`, never in a layout. Rebuild after any edit:

```sh
typst compile --root . --input lang=fr cv/cv-canvas.typ fr/cv-adrien-michaud.pdf
typst compile --root . --input lang=en cv/cv-canvas.typ en/cv-adrien-michaud.pdf
```

`--root .` is required: the template reads `/images/adrien-michaud.jpg`, and
Typst refuses to read outside the root it is given.

The PDFs are committed, because Vercel serves the repository as-is and does not
run Typst. Each language's page links to its own file, and the `download`
attribute renames it on the way out, so the visitor gets
`Adrien-Michaud-CV-FR.pdf` rather than a name that says nothing.

Keep it to one page. The layout is tuned so it just fits; adding a paragraph
will silently push a nearly-empty second page, which reads as a mistake.

## Project card visuals

A card in the Projects section opens with `.project-logo`, a 64px square badge
above the title. The box is square and fixed rather than sized to each image,
so every mark sits on the same baseline down the grid; `object-fit: contain`
protects any that is not exactly 1:1.

Guichet Unique and GuMobile deliberately share one mark. GuMobile *is* that
platform's app, and a badge of its own would have implied a separate product.
Nemo Wifi has no logo — freewifi.ne.ch publishes none of its own, only partner
logos and two banner JPGs.

Screenshots live on the project pages, not the cards, where there is room to
show them at a size worth looking at:

- `.screen-gallery` — a scrolling row of phone screens. It scrolls rather than
  shrinks, because screens squeezed to fit a narrow viewport are unreadable.
- `.shot-figure` — a full-width screenshot of a web page, with a caption.

`.project-media` and its three fillings (`.project-device`, `.project-appicon`,
`.project-shot`) are the earlier full-bleed 16:9 card band. Nothing uses them
today; they are kept because they solve a real problem — one fixed ratio for
sources of mismatched shape — if a card ever carries an image again.

### Where the store assets came from

```sh
curl -s "https://itunes.apple.com/lookup?id=1449990570&country=ch"   # Guichet unique
curl -s "https://itunes.apple.com/lookup?id=1215309614&country=ch"   # Nemo News
```

The CDN re-renders any artwork URL at a chosen width and format — swap a
trailing `/392x696bb.jpg` for `/800x0w.webp`.

**Do not trust the lookup API for screenshots.** It reports `screenshotUrls: []`
for Nemo News, in every device class. That is the API being wrong: the store
page carries eight iPhone screenshots. Scrape the page instead and pull the
`PurpleSource` artwork templates out of its embedded JSON.

Both apps' screenshots are marketing assets rather than raw captures — a
coloured backdrop, a headline burnt into the image, a device frame. All three
are cropped away, along with the fake iOS status bar; the committed files are
the screen interior only. The two apps use different templates, so detect the
frame rather than reusing coordinates: find the bounding box of the dark bezel,
then scan inward from its centre lines for the first non-dark pixel.

Only screenshots whose content has actually been looked at belong here. Alt
text written for an unopened image is a guess, and a screen reader cannot tell
the difference.

### Rights

The logos and store screenshots belong to the clients who published them
(`sellerName: Etat de Neuchatel`). They illustrate work actually done on those
products; they are not presented as this site's own.

## Adding a blog post

### 1. Create the file

Copy `en/blog/post-template.html.template` into `en/blog/` or `fr/blog/` and
rename it to `<slug>.html`. The `.template` extension keeps the scaffold from
being served as a real page — the copy must not keep it.

The template's asset paths already assume `<lang>/blog/`, so they work unchanged
in either language.

### 2. Fill in the placeholders

Every `[PLACEHOLDER]` in the file must be replaced. `[LANG]` is the folder you
copied into, `[OTHERLANG]` the other one, `[SLUG]` the filename without `.html`.
Then write the article body between the two `<!-- Your article content -->`
markers.

Leave `<meta name="robots" content="noindex">` in place while drafting; remove
it to publish.

### 3. Link it from the blog index

In the matching `<lang>/blog/index.html`, add a card:

```html
<article class="blog-card">
    <div class="blog-card-header">
        <span class="blog-date">January 15, 2026</span>
        <div class="blog-tags">
            <span class="blog-tag">.NET</span>
            <span class="blog-tag">Clean Architecture</span>
        </div>
    </div>
    <h2 class="blog-card-title">
        <a href="my-article-title.html">My Article Title</a>
    </h2>
    <p class="blog-card-excerpt">
        A brief summary of your blog post...
    </p>
    <a href="my-article-title.html" class="blog-read-more">Read more →</a>
</article>
```

If the `.blog-empty-state` div is still there, remove it.

### 4. Add it to the sitemap

One `<url>` entry in `sitemap.xml` with the full URL and today's date as
`<lastmod>`. Only list pages that are actually indexable — a page still
carrying `noindex` does not belong there.

## Renaming or moving a page

The URL is the file path, so moving a file breaks its URL. Add a 301 to the
`redirects` array in `vercel.json` whenever you do. `/rappel-privacy.html` is
the one to be most careful with: it is the privacy-policy URL declared to the
App Store and Play Console for the Rappel app.

## Writing tips

- Keep titles concise and descriptive
- Write a compelling excerpt (2–3 sentences)
- Use tags to categorise the content
- Include code examples when relevant

The post template supports headings (h2, h3), paragraphs, lists, inline and
block code, links and images. For syntax highlighting you would need to add
something like Prism.js or highlight.js — nothing is bundled today.
