'use strict';

class coffeeScripts.Views.ProgramView extends Backbone.View

    template: JST['app/scripts/templates/program.hbs']

    events:
      'click .script-link': 'openScript'

    render: ->
      data = ['Aeropress', 'Chemex', 'V60']
      @$el.html(@template(script: data))
      this

    openScript: (event) ->
      script = event.currentTarget.id
      Backbone.history.navigate('scripts/' + script)
