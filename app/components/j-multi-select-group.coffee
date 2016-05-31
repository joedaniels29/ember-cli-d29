`import Ember from 'ember'`
`import JSelectGroup from 'frontend/components/j-select-group'`


JMultiSelectGroup = JSelectGroup.extend(
  init: ->
    this._super()
    @set("selected", []) unless @get("selected")

  canNull: true,
  templateName: "components/j-select-group"
  setupElement: (e)->
    e.set("selected", (@get("selected")?.contains?(e.get("model"))))
  onNewSelected:(->
    if(!@get("midSetting"))
      this.rerender()
  ).observes("selected.[]")

  actions:
    unregisterChild: (element)->
      @set("selectableChildElements.#{element.get("stringData")}", null)
    onDetailSelection: (e)->
      @sendAction("onDetailSelection", e.get("model")) if @get("detailSelection")
    onSelection: (selectedElement, callback)->
      @set("midSetting", true)
      Ember.run.schedule("afterRender", => @set("midSetting", false))
      model = selectedElement.get("model")
      if @get("selected").contains?(model)
#      if @get("canNull")
#        @set("selectedElement", null)
        @get("selected").removeObject(model)
        callback(false)
#        selectedElement.$().removeClass("selected")
      else
        @get("selected").addObject(model)
        callback(true)
#        selectedElement.$().addClass("selected")
    registerChild: (element)->
      #works because this happens after element insert.
      @set("selectableChildElements.#{element.get("stringData")}", element)
      @setupElement?(element)
)

`export default JMultiSelectGroup`
