'use strict';

class coffeeScripts.Models.ScriptModel extends Backbone.Model

  initialize: (options) ->
    @scenes = options.scenes
    @
    total_time = _.reduce(@scenes, ((acc, scene) -> acc + scene.time), 0)
    @seconds = total_time % 60
    @minutes = (total_time - @seconds) / 60
    @index = 0
    @on 'script:begin', =>
      @nextScene()

  # Let the next scene enter. Once the scene ends, let the following scene enter.
  # If all scenes are over, this method fires an 'end' event.
  nextScene: ->
    if @index >= @scenes.length
      @trigger('script:end')
      return

    scene = @scenes[@index]
    setTimeout =>
      @trigger('scene:end', scene)
      @index += 1
      @nextScene()
    , scene.time * 1000

    @trigger('scene:enter', scene)
    console.log 'Just entered:'
    console.log scene
