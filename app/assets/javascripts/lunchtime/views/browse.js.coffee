class App.BrowseView extends Backbone.Marionette.ItemView
  template: "browse"

  events:
    "click .shuffle": "shuffle"

  shuffle: ->
    @collection.reset @collection.shuffle()
