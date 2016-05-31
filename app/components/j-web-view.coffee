`import Ember from 'ember'`

JWebViewComponent = Ember.Component.extend(
  attributeBindings: ["style", "src"]
  onDestroy:( ->
    Ember.$(window).unbind('resize', this.get('resize'));
  ).on("willDestroy")
  width: 500
  height: 500
  heightDidChange: (->
    @set('style', "height:#{@get("height")}px;")
  ).observes("height")


  onInit:( ->
    this._super();
    view = this

    resize = @set('resize', (e)->
      view.calculateDim()
      e.stopPropagation()
    )
    Ember.$(window).on("resize", this.get('resize'))
    this.calculateDim()
  ).on("didInsertElement")

  calculateDim: (->
    variable = @$()
    if !variable
#        @set("width", 500)
      @set("height", 500)

    #      width = variable.innerWidth() #- (parseInt(variable.css("padding").replace("px", ""))*2)
    height = Ember.$(window).height() - Ember.$(this.get("element"))[0].offsetTop
    #      @set("width", width)
    @set("height", height)
  )
  tagName: "iframe"

)

`export default JWebViewComponent`
