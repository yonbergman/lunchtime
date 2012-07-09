class App.RestaurantsSearchView extends Backbone.Marionette.ItemView
  template: "search"
  className: "search"

  ui:
    input: ".search-query"

  events:
    'submit form': 'search'
    "change .search-query": "search"

  initialize: ->
    _.bindAll(@, 'focus')
    _.bindAll(@, 'search')

  onShow: ->
    Mousetrap.bind(['f','ctrl+f','cmd+f'], @focus);
    @ui.input.select2(
      data: App.restaurants.map (rest) -> {id: rest.id, text: rest.get('name')}
    )

  focus: ->
    @ui.input.select2("open")

  search: (ev) ->
    ev.preventDefault()
    restID = ev.target.value
    if restID?
      App.router.gotoShow App.restaurants.get(restID)
