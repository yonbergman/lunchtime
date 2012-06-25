
class App.Restaurant extends Backbone.Model

  defaults:
    name: "Unknown"
    price_range: -1

#  price_range: ->
#    {"-1": "0-35", "0": "35-50"}[@.get('price_range')]

class App.Restaurants extends Backbone.Collection
  model: App.Restaurant
  url: "/restaurants"

