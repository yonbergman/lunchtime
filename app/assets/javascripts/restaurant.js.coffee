# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.app = {}
window.app.Restaurant = Backbone.Model.extend
  price_range: ->
    {"-1": "0-35", "0": "35-50"}[@.get('price_range')]

window.app.Restaurants = Backbone.Collection.extend
  model: window.app.Restaurant
  url: "/restaurants"




window.app.RestaurantRow = Backbone.View.extend
  tagName: "tr"
  render: ->
    $(@el).html(_.template($("#rest_row").html(), @model.toJSON()))
    _.each(@model.get("payment_options"), (option) =>
      img = $("<img>")
      img.attr("src", "/assets/payment_options/#{option}.png")
      @$el.find(".payment_options").append(img)
    )
    @$el

window.app.RestaurantsTable = Backbone.View.extend

  el: ".table"

  initialize: ->
    _.bindAll(@, 'render')
    @collection.bind("reset", @render)

  render: ->
    @collection.each (rest) =>
      row = new app.RestaurantRow(model: rest)
      @$el.append(row.render())


$(document).ready ->
  window.app.restaurants = new window.app.Restaurants()
#  window.app.restaurants.fetch()
  new app.RestaurantsTable( collection: app.restaurants)



