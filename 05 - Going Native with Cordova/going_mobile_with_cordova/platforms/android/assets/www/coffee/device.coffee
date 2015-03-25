$deviceInfo =   ($ '#device-info')

onFetchInfo = ->
  $deviceInfo.empty()
  $deviceInfo.append "<li>Name: #{device.name}</li>"
  $deviceInfo.append "<li>Cordova: #{device.cordova}</li>"
  $deviceInfo.append "<li>Model: #{device.model}</li>"
  $deviceInfo.append "<li>Platform: #{device.platform}</li>"
  $deviceInfo.append "<li>UUID: #{device.uuid}</li>"
  $deviceInfo.append "<li>Version: #{device.version}</li>"
  $deviceInfo.show()

app.demos.device =
  onFetchInfo: onFetchInfo