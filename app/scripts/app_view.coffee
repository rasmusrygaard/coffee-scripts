class coffeeScripts.Views.AppView

  showView: (view) ->
    @currentView.close() if @currentView

    @currentView = view
    @currentView.render()

    $("#stage").html(@currentView.el)

Backbone.View.prototype.close = ->
  @remove()
  @unbind()
  @onClose() if @onClose
