'use strict';

class coffeeScripts.Models.SceneModel extends Backbone.Model

  initialize: ->
    @on 'script:begin', =>
      nextScene()

  # Let the next scene enter. Once the scene ends, let the following scene enter.
  # If all scenes are over, this method fires an 'end' event.
  nextScene: ->
    if @index >= length()
      trigger('script:end')

    scene = get(@index)
    scene.once 'exit', =>
      @index += 1
      nextScene()

    scene.trigger('scene:enter', scene)

