'use strict';

class coffeeScripts.Views.ScriptView extends Backbone.View

    template: JST['app/scripts/templates/script.hbs']

    events:
      "click #start-button": "begin"

    initialize: (options) ->
      @script = options.model

    render: ->
      @$el.html(@template({
        script: @script.toJSON(),
        hasPrelude: @script.get('prelude').length > 0
      }))
      this

    begin: ->
      coffeeScripts.router.navigate("script/#{@script.id}/play", {trigger: true})

