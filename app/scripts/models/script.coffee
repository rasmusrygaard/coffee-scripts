'use strict';

class coffeeScripts.Models.ScriptModel extends Backbone.Model

  PREVIEW_TIME = 5

  initialize: (options) ->
    @scenes = options.scenes

    total_time = _.reduce(@scenes, ((acc, scene) -> acc + scene.time), 0)
    @seconds = total_time % 60
    @minutes = (total_time - @seconds) / 60
    @index = 0
    @on 'script:begin', =>
      @nextScene()

  # Let the next scene enter. Once the scene ends, let the following scene enter.
  # If all scenes are over, this method fires an 'end' event.
  nextScene: ->
    if @allScenesPlayed()
      @trigger('script:end')
      return

    scene = @scenes[@index]
    @timer = setTimeout =>
      @trigger('scene:end', scene)
      @trigger('scene:dequeue')
      @index += 1
      @nextScene()
    , scene.time * 1000

    unless @allScenesPlayed()
      @queueTimer = setTimeout =>
        @trigger('scene:queue', @scenes[@index + 1])
      , (scene.time - PREVIEW_TIME) * 1000

    @trigger('scene:enter', scene)

  allScenesPlayed: ->
    @index >= @scenes.length

  stop: ->
    clearInterval(@timer)
    clearInterval(@queueTimer)
    @index = 0
