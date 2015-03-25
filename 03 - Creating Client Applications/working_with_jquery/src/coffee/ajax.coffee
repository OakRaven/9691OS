templates = {}

$ ->
  Handlebars.registerHelper 'Currency', (value) ->
    return (accounting.formatMoney value)

  ($ '#options-nav').tab()

  loadTemplate 'text'
  loadTemplate 'departments'
  loadTemplate 'employees'

  ($ '#options-nav a').click (e) ->
    e.preventDefault()
    $target = ($ e.target)
    option = $target.data 'option'
    type = $target.data 'type'

    loadData option, type

loadTemplate = (name) ->
  templateHtml = ($ "##{name}-template").html()
  templates[name] = (Handlebars.compile templateHtml)

loadData = (option, type) ->
  url = switch option
    when 'employees' then 'data/employees.json'
    when 'departments' then 'data/departments.json'
    when 'text' then 'data/homers-odyssey.txt'

  call = ($.ajax url, { dataType: type })

  call.done (data) ->
    displayData option, data

displayData = (option, data) ->
  html = templates[option]({value: data})
  ($ '#information-panel').html html