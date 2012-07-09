class App.RestaurantTopDetailsView extends Backbone.Marionette.ItemView

  template: 'restaurant_top'

  events: ->
    "click .goto_map": "showMap"
    "click .goto_sv": "showStreetView"

  serializeData: ->
    data = super
    data.streetMapSource = "http://maps.googleapis.com/maps/api/streetview?size=300x200&location=#{@model.get('address')}&heading=#{@model.get('heading')}&sensor=false&key=AIzaSyBMOegAOwS3jDGWwMwuCbTaGcbmIkDsYF4"
    data.mapSource = "http://maps.googleapis.com/maps/api/staticmap?size=300x200&markers=#{@model.get('address')}&heading=0&sensor=false&key=AIzaSyBMOegAOwS3jDGWwMwuCbTaGcbmIkDsYF4"
    data

  showStreetView: ->
    @$el.find(".map").hide()
    @$el.find(".streetview").show()

  showMap: ->
    @$el.find(".map").show()
    @$el.find(".streetview").hide()