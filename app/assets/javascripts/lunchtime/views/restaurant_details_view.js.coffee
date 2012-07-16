class App.RestaurantTopDetailsView extends Backbone.Marionette.ItemView

  template: 'restaurant_top'

  events:
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

class App.RestaurantMainView extends Backbone.Marionette.ItemView
  template: "restaurant_main"

  events: ->
    "click .btn": "addTip"

  ui:
    form: "form"
    textarea: "textarea"
    tips: "ul"

  addTip: (ev) ->
    ev.preventDefault()
    @model.get("tips").create(content: @ui.textarea.val())
    @ui.form.get(0).reset()

  onShow: ->
    new App.TipsView(collection: @model.get('tips'), el: @ui.tips).render()

class App.TipView extends Backbone.Marionette.ItemView
  template: "tip"
  tagName: "li"

class App.TipsView extends Backbone.Marionette.CollectionView
  itemView: App.TipView
