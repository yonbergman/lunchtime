class App.RestaurantRowView extends Backbone.View
  tagName: "tr"
  template: JST['lunchtime/templates/restaurant_row']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

class App.RestaurantsTableView extends Backbone.View

  el: ".table"

  initialize: ->
    @ui =
      tbody: @$el.find("tbody")
    _.bindAll(@, 'render')
    @collection.bind("reset", @render)
    @render()

  render: ->
    @collection.each (rest) =>
      row = new App.RestaurantRowView(model: rest)
      @ui.tbody.append(row.render().el)
    @
