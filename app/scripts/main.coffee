window.coffeeScripts =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    'use strict'
    console.log 'Hello from Backbone!'
    router = new coffeeScripts.Routers.DirectorRouter()
    Backbone.history.start({ pushState: true })

$ ->
  'use strict'
  coffeeScripts.init();
