'use strict';

class coffeeScripts.Views.ProgramView extends Backbone.View

    template: JST['app/scripts/templates/program.hbs']

    events:
      'click .script-link': 'openScript'

    initialize: (options) ->
      @scripts = options.model

    render: ->
      @$el.empty();
      @undelegateEvents();
      @$el.html(@template(script: @scripts.toJSON()))
      @delegateEvents();
      this

    openScript: (event) ->
      scriptId = event.currentTarget.id
      event.preventDefault()
      coffeeScripts.router.navigate('script/' + scriptId, {trigger: true})
