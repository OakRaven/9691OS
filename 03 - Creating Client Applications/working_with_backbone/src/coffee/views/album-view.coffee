views = appAlbum.views

AlbumView = Backbone.View.extend
  tagName: 'div'
  template: _.template ($ '#album-template').html()

  initialize: ->
    _.bindAll this, 'render'
    @model.bind 'change', this.render
    (@model.get 'images').on 'add', this.render, this

  render: ->
    @.$el.html (@template @model.toJSON())
    album = @model
    (album.get 'images').forEach (img) =>
      imgView = new views.ImageView
        model:
          title: album.get 'title'
          imageRootPath: album.get 'imageRootPath'
          filename: img.get 'filename'
          description: img.get 'description'

      imageHtml = imgView.render().el
      @.$el.find('.well').append imageHtml

    return this

views.AlbumView = AlbumView