application = null
init = (element) ->
  application = new kendo.mobile.Application(element)

window.app =
  application: application
  init: init