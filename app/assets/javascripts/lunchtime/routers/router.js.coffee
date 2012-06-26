class App.Router extends Backbone.Router
  routes:
    "/": "search"
    "restaurant/:id": "show"

  search: ->



  show: (id) ->
    model = App.restaurants.get(id)
    popup = new App.RestaurantDetailsView(model: model)
    popup.show()