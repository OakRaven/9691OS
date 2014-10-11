init = (element) ->
  application = new kendo.mobile.Application(element)

window.app =
  init: init
  demos: {}