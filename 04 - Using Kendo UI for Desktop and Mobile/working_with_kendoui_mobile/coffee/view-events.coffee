window.app = window.app || {}

viewInit = (e) ->
  view = e.view
  (view.element.find '#output').append(
    '<pre>viewInit() called</pre>'
  )

viewShow = (e) ->
  view = e.view
  (view.element.find '#output').append(
    '<pre>viewShow() called</pre>'
  )

window.app.view =
  viewInit: viewInit
  viewShow: viewShow