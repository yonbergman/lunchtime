class App.RestaurantDetailsView extends Backbone.View

  template: JST['lunchtime/templates/restaurant_popup']

  initialize: ->
    @show()

  events: ->
    "click .goto_map": "showMap"
    "click .goto_sv": "showStreetView"

  render: ->
    data = @model.asJSON()
    data.streetMapSource = "http://maps.googleapis.com/maps/api/streetview?size=300x200&location=#{@model.get('address')}&heading=#{@model.get('heading')}&sensor=false&key=AIzaSyBMOegAOwS3jDGWwMwuCbTaGcbmIkDsYF4"
    data.mapSource = "http://maps.googleapis.com/maps/api/staticmap?size=300x200&markers=#{@model.get('address')}&heading=0&sensor=false&key=AIzaSyBMOegAOwS3jDGWwMwuCbTaGcbmIkDsYF4"
    @$el.html($(@template(data)))
    @

  show: ->
    @render()
    @$el.modal()
    @$el.on "hidden", =>
      @options.onClose()

  showStreetView: ->
    @$el.find(".map").hide()
    @$el.find(".streetview").show()

  showMap: ->
    @$el.find(".map").show()
    @$el.find(".streetview").hide()