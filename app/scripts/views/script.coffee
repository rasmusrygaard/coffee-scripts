'use strict';

class coffeeScripts.Views.ScriptView extends Backbone.View

    template: JST['app/scripts/templates/script.hbs']

    events:
      "click #start-button": "begin",
      "click .home-button" : "goHome",
      "click .fullscreen-button" : "fullscreen",

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

    goHome: ->
      coffeeScripts.router.navigate("/", {trigger: true})

    fullscreen: (e) ->
      console.log(e.target)
      $buttonEl = $(e.target).find('span')
      $buttonEl.toggleClass('glyphicon-resize-full')
      $buttonEl.toggleClass('glyphicon-resize-small')
      document.cancelFullScreen = document.webkitExitFullscreen || document.mozCancelFullScreen || document.exitFullscreen;
      if document.webkitIsFullScreen
        document.cancelFullScreen()
      else
        document.documentElement.webkitRequestFullScreen()
