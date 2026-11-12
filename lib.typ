#import "@preview/chic-hdr:0.5.0": *


#let recipes-template(
  title: "Recipes"
) = it => [
  // settings
  #set text(font: "Comic Neue", size: 10pt)
  #set page(paper: "a5")

  // header / footer
  #show: chic.with(
    chic-footer(
      right-side: chic-page-number()
    ),
    chic-header(
      left-side: smallcaps(title)
    ),
    chic-separator(1pt),
    chic-offset(15pt),
    chic-height(2cm),
  )
  
  // title page
  #align(center + horizon)[
    #set text(size: 3em, weight: 700)
    #title
  ]
  #pagebreak()

  // contents page

  #align(center + horizon, 
    block(width: 70%)[
      #heading("Recipes")
      #v(2em)
      #outline(depth: 2, title: none)
      #v(4em)
    ]
  )
  #pagebreak()
  
  // content
  #it
]

#let recipe(el, minutes: none) = [
  // Add actual styling
  #show heading.where(level: 2): it => [
    #emph(it) (#minutes minutes)
  ]

  //nonsense
  #show regex("Peel|Chop|Slice"): set text(fill: blue) 
  #show regex("Heat"): set text(fill: red, weight: 900, size: 1.2em) 
  
  #el
  #pagebreak()
]

#let ingredients(it) = align(left, block(width: 70%, align(left)[
  #set par(spacing: 0.5em)
  #show list: it => {
    let split_ingredient = it => {
      let (ingredient, quantity) = it.body.children
        .filter(x => x != [ ])
        .split([--])

      (
        [#for i in ingredient { i }],
        table.vline(stroke: 0.5pt),
        [#for q in quantity { q }],
      )
    }

    let elems = it.children.map(split_ingredient)

    set table(stroke: none)
    set text(size: 8pt)
    block(fill: gray.lighten(80%),
      table(
        columns: (2fr, 2fr),
        inset: (right: 2em),
        row-gutter: -4pt,
        ..elems.flatten(),
      )
    )
    v(1em)
  }

  #it
]))
