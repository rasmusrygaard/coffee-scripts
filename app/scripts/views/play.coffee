'use strict';

class coffeeScripts.Views.PlayView extends Backbone.View

  template: JST['app/scripts/templates/play.hbs']

  initialize: (options) ->
    @script = options.model

  render: ->
    @$el.html(@template(script: @script.toJSON()))
    this

  play: ->
    @showTimer()
    ticker = @runTimer()
    console.log ticker

    sceneFoo = $('#sceneFoo')
    @script.on 'scene:enter', (scene) =>
      sceneFoo.html(scene.content)

    @script.on 'script:end', =>
      @stopTimer(ticker, @script.minutes, @script.seconds)

    @script.trigger('script:begin')


  showTimer: ->
    $('#timer').show()
    $('#start-button-box').hide()

  runTimer: ->
    minutesEl = $('#minutes-time')
    secondsEl = $('#seconds-time')

    startTime = new Date
    timePassed = ->
      secondsElapsed = (new Date - startTime) / 1000
      [Math.floor(secondsElapsed % 60), Math.floor(secondsElapsed / 60)]

    firstMinute = true
    setInterval =>
      [seconds, minutes] = timePassed()
      has_minutes = minutes > 0
      if has_minutes && seconds < 10
        secondsEl.html("0#{seconds}")
      else
        secondsEl.html("#{seconds}")

      if has_minutes
        if firstMinute
          $('.minutes').show()
          $('.time-separator').show()
          firstMinute = false
        minutesEl.html("#{minutes}")
    , 200

  stopTimer: (timer, finalMinutes, finalSeconds) ->
    $('#minutes-time').html("#{finalMinutes}")
    $('#seconds-time').html("#{finalSeconds}")
    clearInterval(timer)
