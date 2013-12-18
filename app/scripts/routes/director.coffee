'use strict';

class coffeeScripts.Routers.DirectorRouter extends Backbone.Router
  routes:
    "":             "home"
    "script/:id":   "showScript"

  home: ->
    scripts = new coffeeScripts.Collections.ScriptsCollection([
      { id: 1, title: 'Aeropress' },
      { id: 2, title: 'Chemex' },
      { id: 3, title: 'V60' },
      { id: 4, title: 'Stumptown V60' },
      { id: 5, title: 'French Press' },
    ])
    @programView = new coffeeScripts.Views.ProgramView({
      model: scripts
    })
    $('#stage').html(@programView.render().el)

  showScript: (id) ->
    console.log 'showing script'

  initialize: ->
