'use strict';

class coffeeScripts.Routers.DirectorRouter extends Backbone.Router
  routes:
    "":                   "home",
    "/":                  "home",
    "script/:id":         "showScript",
    "script/:id/play":    "playScript",

  home: ->
    @programView ?= new coffeeScripts.Views.ProgramView({
      model: @scripts
    })
    $('#stage').html(@programView.render().el)

  showScript: (id) ->
    script = @scripts.findWhere({id: parseInt(id)})
    scriptView = new coffeeScripts.Views.ScriptView({
      model: script
    })
    $('#stage').html(scriptView.render().el)

  playScript: (id) ->
    script = @scripts.findWhere({id: parseInt(id)})
    playView = new coffeeScripts.Views.PlayView({
      model: script
    })
    $('#stage').html(playView.render().el)
    playView.play()

  initialize: ->
    @scripts = new coffeeScripts.Collections.ScriptsCollection([
      {
        id: 1,
        title: 'Tim Wendelboe',
        description: 'This is Tim Wendelboe\'s Aeropress recipe. It is delicious. It gives a clean, filter-like cup.'
        prelude: 'Rinse the paper filter with running tap water for 10 seconds',
        ingredients : {
          coffee: "14 grams",
          grind: "Fine Filter",
          water: "200 grams",
          time: "20 seconds"
        },
        scenes: [
          {
            time: 10,
            content: [
              'Pour 200g of water at about 95C over the coffee',
              'Stir 3 times',
              'Place the handle on the Aeropress in order to prevent the water from draining ' +
              'through the filter'
            ],
          },
          {
            time: 10,
            content: [
              'Take the handle off, stir 3 times back to front',
              'Place the handle on top of the aeropress and press the contents into a large cup ' +
              'or pitcher by using your body weight'
            ]
          }
        ]
      },
      {
        id: 2,
        title: 'Blue Bottle',
        description: 'This one is blue',
        prelude: 'Assemble your Aeropress and place it upside down on a scale.'
        ingredients: {
          coffee: '15 Grams',
          grind: 'Finer Than Filter',
          water: '400 g, 200 F',
          time: '1 minute'
        },
        scenes: [
          {
            time: 30,
            content: [
              'Pour 30g of water, gently immerse the grounds with a bamboo paddle'
            ]
          },
          {
            time: 60,
            content: [
              'Pour additional 160g of water and let sit for one minute',
              'While waiting, run the remaining hot water through the filter'
            ]
          },
          {
            time: 30,
            content: [
              'Give your grounds 10 vigorous stirs',
              'Screw the cap onto the AeroPress',
              'Position it atop your brew vessel and begin applying downward pressure',
              'Your coffee’s fully brewed once it begins to make a hissing sound'
            ]
          }
        ]
      },
      {
        id: 3,
        title: 'Ritual',
        description: 'We love the Aeropress! It provides a clean, small cup of coffee full of brightness. There are several ways to use this awesome brewer at home. We chose a non-inverted method to ensure ease of use and consistency.',
        prelude: 'Place filter into the bottom of brewing chamber, place aeropress over mug, rinse with hot water, and discard rinse water. Put ground coffee on top of the filter in the brewing chamber.'
        ingredients: {
          coffee: '16 grams',
          grind: 'Fine',
          water: '225 grams',
          time: '1:30'
        },
        scenes: [
          {
            time: 60,
            content: [
              'Slowly pour 225 grams of water onto the grounds',
              'Use a spoon to slowly paddle slurry front to back & left to right',
              'Place the plunger into the chamber pushing in and slowly lifting up, creating a vacuum seal'
            ]
          },
          {
            time: 25,
            content: [
              'Plunge for 25 seconds.'
              'Stir and enjoy.'
            ]
          }
        ]
      },
      {
        id: 4,
        title: 'Stumptown',
        description: 'Using an AeroPress is a fast, easy and convenient way to brew excellent coffee at home. The keys to getting good results are: using high quality, fresh beans; grinding the coffee correctly; using clean equipment; using the right temperature of water; plunging correctly.',
        prelude: 'Place the plunger upside down inside the brewing tube with the black rubber part touching the bottom of the number 4 circle and the top of the plunger on the table. Rinse the filter with hot water and preheat the inverted brewer. Add your coffee to the inverted Aeropress.'
        source: 'http://stumptowncoffee.com/brew-guides/aeropress/'
        ingredients: {
          coffee: '17 grams',
          grind: 'Table Salt Fine',
          water: '225 grams',
          time: '1:20'
        },
        scenes: [
          {
            time: 60,
            content: [
              'Pour hot water into your brewer, saturating the grounds, and pouring to the top of the 3 level.'
              'Use the AeroPress paddle to give a thorough stir.',
              'Next, pour enough water to bring the level to above the level 2 circle.'
              'Place the rinsed filter and black cap on top of brewer and screw it tightly.'
            ]
          },
          {
            time: 10,
            content: [
              'Tip the brewer to a 45 degree angle and spin it.'
            ]
          },
          {
            time: 10,
            content: [
              'Flip the brewer on top of your mug and plunge with gentle and steady pressure, stopping as soon as you hear a hissing sound.'
            ]
          }
        ]
      }
    ])
