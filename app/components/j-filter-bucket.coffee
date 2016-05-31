`import Ember from 'ember'`
`//import Droppable from"ic-droppable"`

JFilterBucketComponent = Ember.Component.extend(Droppable,
#  tagName: "j-filter-bucket"
  classNameBindings:[ ":j-filter-bucket", "dragging:j-filter-dragging:"]

  validateDragEvent: (event) ->
    event.dataTransfer.types.contains "text/j-filter-droplet"

  acceptDrop: (event) ->
    tacoData = event.dataTransfer.getData("text/j-filter-droplet")
    @sendAction("onDrop", tacoData)

  addFilter: (d) ->
    @set("jsonConfirmation", d)

  actions:
    dragEnter:()-> @set("itemIsDraggingOver", true)
    dragLeave:()-> @set("itemIsDraggingOver", false)

    remove: (item)->
      @get("filters.#{item}").removeObject(item.index)

)
`export default JFilterBucketComponent`
