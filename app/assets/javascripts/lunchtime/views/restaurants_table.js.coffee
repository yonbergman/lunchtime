class App.RestaurantRowView extends Backbone.View
  tagName: "tr"
  template: JST['lunchtime/templates/restaurant_row']

  events:
    "click": "showDetails"

  render: ->
    @$el.html(@template(@model.asJSON()))
    @

  showDetails: ->
    App.router.navigate("/restaurant/#{@model.id}", true)

class App.RestaurantsTableView extends Backbone.View

  el: ".table"

  initialize: ->
    @ui =
      tbody: @$el.find("tbody")
    _.bindAll(@, 'render')
    @collection.bind("reset", @render)
    @render()

  render: ->
    @ui.tbody.html("")
    @collection.each (rest) =>
      row = new App.RestaurantRowView(model: rest)
      @ui.tbody.append(row.render().el)
    @
