#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers


window.App = new Backbone.Marionette.Application();

App.addRegions(
  top :   ".top"
  main:   ".main"
)

App.addInitializer ->
  App.restaurants = new App.Restaurants();
  App.router = new App.Router()

App.bind "start", ->
  Backbone.history.start()