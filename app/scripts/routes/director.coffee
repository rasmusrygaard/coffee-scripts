'use strict';

class coffeeScripts.Routers.DirectorRouter extends Backbone.Router
  routes:
    "":                   "home"
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
          grind: "Fine Filter Ground",
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
      { id: 2, title: 'Chemex' },
      { id: 3, title: 'V60' },
      { id: 4, title: 'Stumptown V60' },
      { id: 5, title: 'French Press' },
      {
        id: 6,
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
              'Pour 30g of water, gently immerse the grounds with a bamboo paddle.'
            ]
          },
          {
            time: 60,
            content: [
              'Pour additional 160g of water and let sit for one minute.',
              'While waiting, run the remaining hot water through the filter.'
            ]
          },
          {


          }
        ]
      }
    ])
