`import Ember from 'ember'`
`import JSelectGroup from 'frontend/components/j-select-group'`

FrontendComponent = JSelectGroup.extend(
  canNull: false

  init: ->
    this._super()
    @set("selectable", moment.monthsShort())

  onSelectDate: (->
    date = @get("selectedDate")
    old_value = @get("selectedYear")
    new_value = date.year()
    @set("selectedYear", new_value)  unless !old_value == new_value
    old_value = @get("selectedMonth")
    new_value = date.month()
    @set("selectedMonth", new_value)  unless !old_value == new_value
  ).observes("selectedDate", "_mod").on("init")


#  onSelectedDate: (->
#    a = @get("selectedDate")
#    a.month(@get("selectedElement.model"))
#    @setDate(a)
#  ).observes("selectedDate", "_mod")

  setDate: (date)->
    return if !date?
    unless this.get("selectedDate").isSame(date)
      @set("selectedDate", date)
      @mod()



  setupElement: (e)->
    model = e.get("model")
    return unless model?
    @selectElement(e) if moment().month(model).month() == @get("selectedMonth")


  year: Ember.computed("selectedDate", "_mod", ->
    @get("selectedDate")?.year())
  previousYear: Ember.computed("selectedDate", "_mod", ->
    @get("selectedDate")?.year() - 1
  )
  nextYear: Ember.computed("selectedDate", "_mod", ->
    @get("selectedDate")?.year() + 1
  )


  didInsertElement: ->
    Engine = famous.core.Engine
    menuContext = Engine.createContext(this.$(".month-picker-fieldset")[0])
    menuItems = this.$("li.month").toArray()

    MENU_TRANSITION =
      duration: 150
      curve: "easeOut"

    #    menuContextCheck = famous.utilities.Utility.after(menuItems.length * 2, Engine.deregisterContext.bind(Engine, menuContext))
    modifiers = []
    surfaces = []
    i = 0

    while i < menuItems.length
      linkElement = menuItems[i]
      surfaces[i] = new famous.core.Surface(
        content: linkElement,
        size: [30, 22]
        properties:
          display: "inline-block"
      )
      opacityState = new famous.transitions.Transitionable(0)
      positionState = new famous.transitions.Transitionable(-3)
      positionMap = famous.transitions.CachedMap.create((position) ->
        famous.core.Transform.translate position, 0, 0
      )
      modifiers[i] = new famous.core.Modifier(
        transform: ((positionMap, positionState) ->
          positionMap positionState.get()
        ).bind(this, positionMap, positionState)
        opacity: opacityState
      )
      famous.utilities.Timer.setTimeout ((opacityState, positionState) ->
        opacityState.set 1, MENU_TRANSITION
        positionState.set 0, MENU_TRANSITION
#        return
      ).bind(null, opacityState, positionState), i * 100
      menuContext.add(modifiers[i]).add surfaces[i]
      i++

  onMonthElementSelect: (->
    variable = moment(@get("selectedDate"))
    variable.month(@get("selectedElement.model"))
    @setDate(variable)
  ).observes("selectedElement")

  mod: ->
    @set("_mod", Math.random())

  actions:
    back: () ->
      variable = moment(@get("selectedDate"))
      variable?.subtract("y", 1)
      @setDate(variable)
      @mod()


    forward: () ->
      variable = moment(@get("selectedDate"))
      variable?.add("y", 1)
      @setDate(variable)
      @mod()
)

`export default FrontendComponent`
