#let recipe(el, minutes: none) = [
  // Add actual styling
  #show heading.where(level: 2): it => [#emph(it) (#minutes minutes)]
  #block(breakable: false)[
    #el
  ]
]

#let ingredients(it) = [
  #show list: it => {
    let split_ingredient = it => {
      let (ingredient, quantity) = it.body.children
        .filter(x => x != [ ])
        .split([--])

      (
        [#for i in ingredient { i }],
        [#for q in quantity { q }],
      )
    }

    let elems = it.children.map(split_ingredient)

    table(
      columns: 2,
      stroke: 1pt + color.lighten(gray, 40%),
      inset: (right: 2em),
      // table.header([Ingredient], [quantity]),
      ..elems.flatten(),
    )
  }

  #it
]
