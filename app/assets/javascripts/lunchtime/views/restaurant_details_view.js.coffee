class App.RestaurantDetailsView extends Backbone.View

  template: JST['lunchtime/templates/restaurant_popup']

  initialize: ->
    @show()

  render: ->
    $(@template(@model.asJSON()))

  show: ->
    @el = @render()
    @el.modal()
    @el.on "hidden", =>
      @options.onClose()
