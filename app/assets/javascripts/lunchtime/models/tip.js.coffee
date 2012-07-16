class App.Tip extends Backbone.Model

  defaults:
    content: "Lorem Ipsum"

class App.Tips extends Backbone.Collection
  model: App.Tip
  url: -> "/restaurants/#{@parent.id}/tips"

  initialize: (coll,options) ->
    @parent = options.parent