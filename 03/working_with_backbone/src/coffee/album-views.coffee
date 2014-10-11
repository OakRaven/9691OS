models = appAlbum.models
views = appAlbum.views

album = new models.Album()

$ ->
  ($ document).on 'dataLoaded', ->
    raw = appAlbum.data.album

    album.set 'title', raw.title
    album.set 'imageRootPath', raw.imageRootPath
    album.set 'images', (new models.ImageCollection raw.images[0..5])

    view = new views.AlbumView
      el: ($ '#album-container')
      model: album

    view.render()

  ($ '#add-button').click ->
    data = appAlbum.data
    if data.additionalImages.length > 0
      img = data.additionalImages.shift()
      (album.get 'images').push (new models.Image img)
      if data.additionalImages.length is 0
        ($ '#add-button').attr 'disabled', true


  ($.getJSON 'data/images.json').then (data) ->
    appAlbum.data =
      album:
        title: data.title
        imageRootPath: data.imageRootPath
        images: data.images[0..5]
      additionalImages: data.images[6..9]

    ($ document).trigger 'dataLoaded'