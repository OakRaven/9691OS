class Image extends Backbone.Model
  defaults:
    filename: ''
    description: ''

  thumbnail: ->
    "tn_#{@get 'filename'}"

class ImageCollection extends Backbone.Collection
  model: Image

class Album extends Backbone.Model
  defaults:
    title: ''
    imageRootPath: ''
    images: new ImageCollection()

displayAlbum = (album) ->
  tmpl = _.template ($ '#album-template').html()
  ($ '#album-container').append (tmpl album)

window.appAlbum =
  models:
    Album: Album
    Image: Image
    ImageCollection: ImageCollection
  views: {}
  displayAlbum: displayAlbum
