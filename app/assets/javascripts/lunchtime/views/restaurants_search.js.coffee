class App.RestaurantsSearchView extends Backbone.View
  el: ".search"
  events:
    'click .shuffle': 'shuffle'

  shuffle: ->
    @collection.reset(@collection.shuffle())