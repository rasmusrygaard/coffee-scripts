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
        title: 'Aeropress',
        description: 'This is Tim Wendelboe\'s Aeropress recipe. It is delicious.'
        prelude: [
          'Rinse the paper filter with running tap water for 10 seconds',
          'Use 14 grams of freshly fine filter ground coffee (light roast)',
        ],
        scenes: [
          {
            time: 60,
            content: [
              'Pour 200g of water at about 95C over the coffee',
              'Stir 3 times',
              'Place the handle on the Aeropress in order to prevent the water ' +
              'from draining through the filter'
            ],
          },
          {
            time: 10,
            content: 'bar'
          }
        ]
      },
      { id: 2, title: 'Chemex' },
      { id: 3, title: 'V60' },
      { id: 4, title: 'Stumptown V60' },
      { id: 5, title: 'French Press' },
    ])
