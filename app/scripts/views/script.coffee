'use strict';

class coffeeScripts.Views.ScriptView extends Backbone.View

    template: JST['app/scripts/templates/script.hbs']

    events:
      "click #start-button": "begin"

    initialize: (options) ->
      @script = options.model

    render: ->
      @$el.html(@template(script: @script.toJSON()))
      this

    begin: ->
      toggleTimer()

      @minutes = $('#minutes-time')
      @seconds = $('#seconds-time')

      startTime = new Date
      timePassed = ->
        secondsElapsed = (new Date - startTime) / 1000
        [Math.floor(secondsElapsed % 60), Math.floor(secondsElapsed / 60)]

      firstMinute = true
      @ticker =
        setInterval =>
          [seconds, minutes] = timePassed()
          @seconds.html("#{seconds}")

          if minutes > 0
            if firstMinute
              $('.minutes').show()
              firstMinute = false
            @minutes.html("#{minutes}")
        , 200

    toggleTimer: ->
      $('#timer').show()
      $('#start-button-box').hide()
