`import Ember from 'ember'`

JDroppableComponent = Ember.Component.extend(
    actions:
      setSelected:(e)->
        @set("selected", e)
      confirmKeyElement:(e) ->
        @sendAction('confirmKeyElement', e)
      removeElement:(e) ->
        @sendAction('removeElement', e)
  )


`export default JDroppableComponent `
