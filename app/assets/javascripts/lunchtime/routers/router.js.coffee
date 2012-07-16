class App.Router extends Backbone.Router
  routes:
    "": "search"
    "browse": "browse"
    "random": "random"
    "s/:id/:name": "show"
    "lucky": "show"

  search: ->
    App.search ||= new App.RestaurantsSearchView(collection: App.restaurants);
    App.recommended ||= new App.RecommendedView({collection: App.restaurants})
    App.top.show(App.search)
    App.main.show(App.recommended)

  browse: ->
    App.top.show(new App.BrowseView(collection: App.restaurants))
    App.main.show(new App.RestaurantsTableView(collection: App.restaurants))

  random: ->
    random = _.first(App.restaurants.shuffle())
    @show(random.id)

  lucky: ->
    new App.RestaurantsTableView({collection: App.restaurants});

  show: (id) ->
    model = App.restaurants.get(id)
    App.top.show(new App.RestaurantTopDetailsView(model: model))
    App.main.show(new App.RestaurantMainView(model: model))

  gotoShow: (model)->
    @navigate("/s/#{model.id}/#{model.get('name')}", true)
