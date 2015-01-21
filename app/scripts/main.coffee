window.coffeeScripts =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Helpers: {}
  init: ->
    'use strict'
    @router = new @Routers.DirectorRouter(appView: new @Views.AppView())
    Backbone.history.start({ pushState: true })

$ ->
  'use strict'
  coffeeScripts.init();
