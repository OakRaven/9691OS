application = null
appInit = ->
  tabstrip = ($ '.km-tabstrip').data('kendoMobileTabStrip')
  currentItem = tabstrip.currentItem().text()
  console.log "Current tab: ", currentItem

init = (element) ->
  application = new kendo.mobile.Application(element, { init: appInit })

window.app =
  application: application
  init: init