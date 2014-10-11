$locationStatus = ($ '#location-status')
$locationError =  ($ '#location-error')
$locationInfo =   ($ '#location-info')
watchHandle =     null

onFetchLocation = ->
  onSuccess = (pos) ->
    $locationInfo.empty()
    $locationStatus.hide()

    $locationInfo.append \
      "<li>Latitude: #{pos.coords.latitude}</li>"
    $locationInfo.append \
      "<li>Longitude: #{pos.coords.longitude}</li>"
    $locationInfo.append \
      "<li>Altitude: #{pos.coords.altitude}</li>"
    $locationInfo.append \
      "<li>Accuracy: #{pos.coords.accuracy}</li>"
    $locationInfo.append \
      "<li>Heading: #{pos.coords.heading}</li>"
    $locationInfo.append \
      "<li>Speed: #{pos.coords.speed}</li>"
    $locationInfo.append \
      "<li>Timestamp: #{pos.timestamp}</li>"

    $locationInfo.show()

  onError = (err) ->
    $locationStatus.hide()

    errorMessage =
      "<h4>Error: #{err.code}</h4><p>#{err.message}</p>"
    $locationError.html errorMessage
    $locationError.show()

  $locationStatus.show()

  navigator.geolocation.getCurrentPosition onSuccess, onError

onWatch = ->
  positionChanged = (pos) ->
    $locationInfo.empty()
    $locationInfo.append \
      "<li>Latitude: #{pos.coords.latitude}</li>"
    $locationInfo.append \
      "<li>Longitude: #{pos.coords.longitude}</li>"
    $locationInfo.append \
      "<li>Timestamp: #{pos.timestamp}</li>"

  onError = (err) ->
    $locationStatus.hide()

    errorMessage =
      "<h4>Error: #{err.code}</h4><p>#{err.message}</p>"
    $locationError.html errorMessage
    $locationError.show()

  watchHandle = \
    navigator.geolocation.watchPosition positionChanged, onError

onWatchCancelled = ->
  if watchHandle
    navigator.geolocation.clearWatch watchHandle
    watchHandle = null

app.demos.location =
  onFetchLocation: onFetchLocation
  onWatch: onWatch
  onWatchCancelled: onWatchCancelled