(() ->

  # helper method
  bindUI = ->
    @ui = {} unless @ui?

    # The first time we store the original ui bindings from the ui hash,
    # since afterwards the ui hash will be overidden with the actual jquery objects.
    @uiBindings = @ui unless @uiBindings?
    @ui = {}
    _.each(_.keys(@uiBindings), (key) =>
      selector = @uiBindings[key]
      @ui[key] = @$(selector)
    )

  # CompositeView augmentation
  origCompositeViewConstructor = Backbone.Marionette.CompositeView.prototype.constructor
  Backbone.Marionette.CompositeView.prototype.constructor = (options) ->
    origCompositeViewConstructor.call(@, options)
    @on("composite:model:rendered", =>
      bindUI.call(@)
    )

  # ItemView augmentation
  Backbone.Marionette.ItemView.prototype.render = () ->
    @beforeRender() if @beforeRender
    @trigger("before:render", @)
    @trigger("item:before:render", @)

    data = @serializeData()
    template = @getTemplate()
    html = Backbone.Marionette.Renderer.render(template, data)
    @$el.html(html)

    bindUI.call(@)
    @onRender() if @onRender
    @trigger("render", @)
    @trigger("item:rendered", @)
)()

