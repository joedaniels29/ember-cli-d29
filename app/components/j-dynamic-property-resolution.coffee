`import Ember from 'ember'`

FrontendComponent = Ember.Component.extend(
  tagName:"span"
#  didInsertElement:(e)->




  name: (->
    theThing = @get("thing")
    theProperty = @get("property")
    console.log(theProperty);
    return null unless theThing? && theProperty?

    return "#{theThing.get(theProperty)}" if (theThing.get?)
    return "#{theThing[theProperty]}"
  ).property("thing","property")


)

`export default FrontendComponent`
