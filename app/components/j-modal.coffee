`import Ember from 'ember'`

JModalComponent = Ember.Component.extend(
  isOpen:true

  title:"stuff"
  actions:
    close: ->

      @sendAction("close")


)

`export default JModalComponent`
