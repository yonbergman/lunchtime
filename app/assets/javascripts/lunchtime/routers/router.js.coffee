class App.Router extends Backbone.Router
  routes:
    "/": "search"
    "restaurant/:id": "show"

  search: ->



  show: (id) ->
    model = App.restaurants.get(id)
    new App.RestaurantDetailsView(model: model, onClose: => @navigate('/', true))
