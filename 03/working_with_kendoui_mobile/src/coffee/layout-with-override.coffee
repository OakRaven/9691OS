window.app = window.app || {}

onClick = (e) ->
  alert 'Thanks for clicking the button!'

window.app.view =
  second:
    onClick: onClick