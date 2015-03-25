models = appAlbum.models
album = new models.Album()

$ ->
  ($.getJSON 'data/images.json').then (data) ->
    album.set 'title', data.title
    album.set 'imageRootPath', data.imageRootPath
    album.set 'images', (new models.ImageCollection data.images)

    appAlbum.displayAlbum album.toJSON()

appAlbum.data =
  album: album