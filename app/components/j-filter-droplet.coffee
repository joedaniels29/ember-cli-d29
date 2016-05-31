`import Ember from 'ember'`

JFilterDropletComponent = Ember.Component.extend(
  tagName: "span"
  classNameBindings: ["dynamicClass", ":j-filter-droplet", "selected"]
  attributeBindings: ["draggable"]
  draggable: "false"

  dynamicClass: null

  noDynamicClass: Ember.computed.equal("dynamicClass", "")
  hasDynamicClass: Ember.computed.not("noDynamicClass")

  setDynamicClass: (->
    if @get("dynamicClassEnabled")
      buttonClassProperty = @get("dynamicButtonClass")
      classPrefix = @get("dynamicClassPrefix") || ""
      buttonClassVal = @get("model.#{buttonClassProperty}")
      if buttonClassVal?
        @set("dynamicClass", "#{classPrefix}#{buttonClassVal}")
        return
      buttonClassProperty = @get("itemLabel")
      buttonClassVal = @get("model.#{buttonClassProperty}")
      if buttonClassVal?
        @set("dynamicClass", "#{classPrefix}#{buttonClassVal}")
        return
    else
      @set("dynamicClass", "")
  ).observes("model", "classPrefix", "dynamicButtonClass").on("init")
  setEventData: ((event) ->
#    tacoData = JSON.stringify(@get("model"))
    event.dataTransfer.setData("text/j-filter-droplet", @get("model")._typeof)
    this.sendAction('action', @get("model"))
  ).on("dragStart")
  dropEventData: (() ->
    this.sendAction('action', false)
  ).on("mouseUp")

#  selected: (() ->
#    this.sendAction('click', this)
#  ).on("mouseDown")
  stringData: Ember.computed.alias("data")

  registerWithParent: (-> this.sendAction("onDidInsertElement", this)).on("didInsertElement")

  _onInsertElement: (-> this.sendAction("onWillInsertElement", this)).on("didInsertElement")

  clickHandler: (()->
    this.sendAction("onSelection", this, (selected)=>
      @set("selected", true)
    )
  ).on('click')
  actions:

    onDetailSelection: ->
      this.sendAction("onDetailSelection", this)
    dragEnd: ()->
      this.sendAction('action', null)
);

`export default JFilterDropletComponent`
