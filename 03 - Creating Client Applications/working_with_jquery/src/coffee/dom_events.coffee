$ ->
  # Using an id selector, event is on single DOM element
  # Element must exist
  ($ '#first-button').click (e) ->
    e.preventDefault()
    addNewButton()

  # Using general selector, event is on all matching DOM elements
  # Elements must exist
  ($ 'ul#color-list a').click (e) ->
    e.preventDefault()
    color = ($ e.target).data('color')
    alert "Thank you for selecting #{color}."

  # Using deferred handler, event will be on any matching element
  # Element does not have to exist
  ($ document).on 'click', 'button.new-button', (e) ->
    e.preventDefault()
    buttonValue = ($ e.target).data 'counter'
    alert "You clicked button ##{buttonValue}"


buttonCounter = 1

addNewButton = ->
  html = $ "<p><button class='btn btn-default new-button'
    data-counter='#{buttonCounter}'>
    New Button #{buttonCounter}
    </button></p>"

  ($ '#action-items').append html
  buttonCounter += 1