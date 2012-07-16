class App.RestaurantRowView extends Backbone.Marionette.ItemView
  tagName: "tr"
  template: 'restaurant_row'

  events:
    "click": "showDetails"

  showDetails: ->
    App.router.gotoShow(@model)

class App.RestaurantsTableView extends Backbone.Marionette.CompositeView
  tagName: "table"
  template: 'restaurant_table'
  className: "table table-bordered table-striped"

  itemView: App.RestaurantRowView
  itemViewContainer: "tbody"