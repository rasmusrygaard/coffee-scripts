'use strict';

class coffeeScripts.Routers.DirectorRouter extends Backbone.Router
  routes:
    "": "home"

  home: ->
    @programView = new coffeeScripts.Views.ProgramView()
    $('#stage').html(@programView.render().el)

  initialize: ->
    console.log 'director:initialize'
