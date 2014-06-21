'use strict';

class coffeeScripts.Collections.ScriptsCollection extends Backbone.Collection
  model: coffeeScripts.Models.ScriptModel

  initialize: ->
    @index = 0

  # Start the script with the given id.
  readScript: (id) ->
    script = findWhere(id: id)

    script.on 'scene:end', =>
      trigger 'scene:end'

    script.once 'script:end', =>
      script.off 'scene:end'
      trigger 'script:end'

    script.trigger 'script:begin'
