class App.RecommendedView extends Backbone.Marionette.ItemView
  template: 'recommended'

  onRender: ->
    @collection.each (rest) =>
      @$el.find("ul.fav").append(new App.RestaurantItemView(model: rest).render().el)
    @collection.each (rest) =>
      @$el.find("ul.new").append(new App.RestaurantItemView(model: rest).render().el)
    @

class App.RestaurantItemView extends Backbone.View

  template: JST['restaurant_item']
  tagName: "li"

  events:
    "click": "select"

  render: ->
    @$el.html(@template(@model.asJSON()))
    @

  select: ->
    App.router.gotoShow(@model)