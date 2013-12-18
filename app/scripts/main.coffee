window.coffeeScripts =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'
    @router = new @Routers.DirectorRouter()
    Backbone.history.start({ pushState: true })

$ ->
  'use strict'
  coffeeScripts.init();
