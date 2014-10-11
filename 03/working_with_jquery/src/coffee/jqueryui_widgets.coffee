$ ->
  # Create a progress bar
  ($ '#progressbar').progressbar { value: 50 }

  # Create a slider
  ($ '#slider').slider
    value: 50
    change: sliderChange

  # Create a date picker
  ($ '#datepicker').datepicker()

  # Load departments from server and create auto-complete
  ($.getJSON 'data/departments.json')
    .done (data) ->
      ($ '#autocomplete').autocomplete { source: data }
    .fail (res) ->
      alert 'Cannot load departments. ' + res.statusText

sliderChange = (e, ui) ->
  ($ '#progressbar').progressbar 'option', 'value', ui.value

