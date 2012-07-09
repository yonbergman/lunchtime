
class App.Restaurant extends Backbone.Model

  defaults:
    name: "Unknown"
    price_range: -1
    heading: 0
    theme: null
    location: null

  priceRange: ->
    {"-1": "0-35", "0": "35-50", "1": "55-70"}[@get('price_range')]

  asJSON: ->
    json = @toJSON()
    json['price_range'] = @priceRange()
    json

class App.Restaurants extends Backbone.Collection
  model: App.Restaurant
  url: "/restaurants"

