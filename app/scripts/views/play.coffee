'use strict';

class coffeeScripts.Views.PlayView extends Backbone.View

  template: JST['app/scripts/templates/play.hbs']

  timer = undefined
  
  initialize: (options) ->
    @script = options.model

  render: ->
    @$el.html(@template(script: @script.toJSON()))
    this

  play: ->    
    @showTimer()
    ticker = @runTimer()

    thisScene = $('#this-scene')
    nextScene = $('#next-scene')
    nextSceneContainer = $('.preview-container')
    @script.on 'scene:enter', (scene) =>
      window.navigator.vibrate(200)
      document.getElementById("beep-sound").play()
      thisScene.html(@toList(scene))

    @script.on 'scene:queue', (scene) =>
      nextSceneContainer.show()
      nextScene.html(@toList(scene))

    @script.on 'scene:dequeue', ->
      nextSceneContainer.hide()
      nextScene.html('')
      
    @script.on 'script:end', =>
      @stopTimer(ticker, @script.minutes, @script.seconds)

    @script.trigger('script:begin')


  showTimer: ->
    $('#timer').show()
    $('#start-button-box').hide()

  runTimer: ->
    if PlayView.timer?
      clearInterval(PlayView.timer)
      @script.stop()
    
    minutesEl = $('#minutes-time')
    secondsEl = $('#seconds-time')

    startTime = new Date
    timePassed = ->
      secondsElapsed = (new Date - startTime) / 1000
      [Math.floor(secondsElapsed % 60), Math.floor(secondsElapsed / 60)]

    firstMinute = true
    PlayView.timer = setInterval =>
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
    , 60

  stopTimer: (timer, finalMinutes, finalSeconds) ->
    $('#minutes-time').html("#{finalMinutes}")
    $('#seconds-time').html("#{finalSeconds}")
    clearInterval(PlayView.timer)

  toList: (scene) ->
    return '' unless scene
    _.map(scene.content, (content) -> "<li>#{content}</li>")
