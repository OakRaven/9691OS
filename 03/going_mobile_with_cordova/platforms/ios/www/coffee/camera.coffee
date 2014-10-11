displayPhoto = (img) ->
  photo = (document.getElementById 'photo')
  photo.src = 'data:image/jpeg;base64,' + img

onTakePhoto = ->
  success = (img) ->
    displayPhoto img

  fail = (msg) ->
    alert 'Camera failed: ' + msg

  options =
    quality: 50
    destinationType: Camera.DestinationType.DATA_URL

  navigator.camera.getPicture success, fail, options

onSelectPhoto = ->
  success = (img) ->
    displayPhoto img

  fail = (msg) ->
    alert 'Load failed: ' + msg

  options =
    destinationType: Camera.DestinationType.DATA_URL
    sourceType: Camera.PictureSourceType.PHOTOLIBRARY

  navigator.camera.getPicture success, fail, options

app.demos.camera =
  onTakePhoto:   onTakePhoto
  onSelectPhoto: onSelectPhoto