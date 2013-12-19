'use strict';

class coffeeScripts.Routers.DirectorRouter extends Backbone.Router
  routes:
    "":             "home"
    "script/:id":   "showScript"

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

  initialize: ->
    @scripts = new coffeeScripts.Collections.ScriptsCollection([
      { id: 1, title: 'Aeropress' },
      { id: 2, title: 'Chemex' },
      { id: 3, title: 'V60' },
      { id: 4, title: 'Stumptown V60' },
      { id: 5, title: 'French Press' },
    ])
