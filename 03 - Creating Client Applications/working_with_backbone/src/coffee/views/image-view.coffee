ImageView = Backbone.View.extend
  tagName: 'a'
  template: _.template ($ '#image-template').html()

  render: ->
    @$el.html ($ (@template @model))
    @$el.attr
      'data-lightbox': @model.title
      href: "#{@model.imageRootPath}#{@model.filename}"
      title: @model.description

    return this

appAlbum.views.ImageView = ImageView