= Recipes

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

#recipe(
  minutes: 40,
)[
  == Fried Mee Noodles with Soy Sauce

  { Insert picture }

  { Insert short description }

  === Ingredients

  #ingredients[
    Noodles:

    - Dried mee noodles -- 450 g
    - Carrot -- 160 g ~ (1/2 stick)
    - Leek -- 1 pc
    - Bell pepper -- 300 g ~ (1 pc)
    - Chinese cabbage -- 400 g
    - Vegetable oil -- 1 tbsp

    Seasoning:

    - Japanese fish stock -- 1 tbsp
    - Soy sauce -- 4 tbsp
    - Mirin -- 2 tbsp
    - Walnut oil -- 1 tbsp
    - Sesame seeds -- 2 g
    - Black pepper --
  ]

  === Preparation

  + Peel the carrot then cut it in half length-wise, slice it to thin
    half-circles.
  + Remove the stem of the bell pepper, then chop to large, bite-sized pieces.
  + Chop the Chinese cabbage in into pieces no larger than $4" cm"^2$.
  + Slice the leek to approx. 1 cm wide circles.
  + Heat up a large wok pan to high then add a tablespoon of vegetable oil.
    Add the carrots and bell peppers. Sizzle for 1 minute. Then add the cabbage
    too. Cook until the ingredients start to soften, then set aside.
  + Heat up water in a pot and salt it to taste. Once boiling, add the Mee
    noodles and cook for 1 minute less than the instruction says.
  + After the noodles are done, strain them and add to the wok pan. Add the
    leek too.
  + Season the work with 1 tbsp of fish stock, and 2 tbsp of mirin and 4 tbsp of
    soy sauce. Mix, then fry until they mostly evaporate.
  + Once evaporated, add 1 tbsp walnut oil and generously season with black
    pepper. Mix and cook for about a minute until ready.
  + Plate the wok with tongs then garnish with sesame seeds. Enjoy!
]

#recipe(
  minutes: 15,
)[
  == Chud Cordon Bleu with Steamed Rice

  { Insert picture }

  { Insert short description }

  === Ingredients

  #ingredients[
    - Jasmine rice -- 1 cup
    - Tinned corn -- ??? g
    - Pre-made cordon bleu 💀 -- 2 pc
    - Tomato -- 1 pc
    - Vegetable oil -- 1 tbsp
    - Parsley ~ (optional) --
    - Salt --
    - Water --
  ]

  === Preparation

  + Put 1 cup of rice and 2 cups of water to boil. If you are using Basmati
    rice, use 2.5 cups of water instead.
  + Heat up 1 tbsp of vegetable oil in a small pan, fry both sides of the cordon
    bleu. Flip after a side is browned and add more oil if necessary.
  + Once the rice is done, add corn and mix.
  + Scoop the rice with a spatula into a ladle, then make rice "buns" by
    flipping the ladle upside down and emptying it onto the plate.
  + Slice up a tomato and plate the cordon bleu next to the rice with a few
    tomato slices. Enjoy!
]
