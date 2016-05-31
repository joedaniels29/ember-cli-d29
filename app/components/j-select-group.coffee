`import Ember from 'ember'`

JSelectGroup = Ember.Component.extend(

  init: ->
    this._super()
    @set("selectableChildElements", Ember.Object.create())


  canNull:true,
  selectedElement:null,

#  selected: Ember.computed.alias("selectedElement.model")

  setupElement: (e)->
    e.$().addClass("selected") if (@get("selected") == e.get("model"))

  selectElement: (selectedElement)->
    old = @get("selectedElement")
    if old == selectedElement
      if @get("canNull")
        @set("selectedElement", null)
        @set("selected", null)
        selectedElement.$().removeClass("selected")
    else
      if old?
        old.$?().removeClass("selected")
      @set("selectedElement", selectedElement)
      @set("selected", selectedElement.get("model"))

      selectedElement.$().addClass("selected")


  actions:
    select: (selectedElement)->
      @selectElement(selectedElement)

    unregisterChild: (element)->
      @set("selectableChildElements.#{element.get("stringData")}", null)


    registerChild: (element)->
      #works because this happens after element insert.
      @set("selectableChildElements.#{element.get("stringData")}", element)
      @setupElement?(element)

)

`export default JSelectGroup`
