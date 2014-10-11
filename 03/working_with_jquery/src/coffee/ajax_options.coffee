$ ->
  templateHtml = ($ '#departments-template').html()
  departmentsTemplate = _.template templateHtml

  # Using ajax() the old way
  ($ '#first-button').click (e) ->
    method = 'ajax() the old way'
    $.ajax 'data/departments.json',
      dataType: 'json',
      complete: (res) ->
        displayDepartments method, res.responseJSON
      error: (res) ->
        displayError method, res.statusCode, res.statusText

  # Using ajax() with deferred
  ($ '#second-button').click (e) ->
    method = 'ajax() with deferred'
    xhr = ($.ajax 'data/departments.json', {dataType: 'json'})
    xhr.done (data) ->
        displayDepartments method, data
    xhr.fail (res) ->
      displayError method, res.statusCode, res.statusText

  # Using get()
  ($ '#third-button').click (e) ->
    method = 'get()'
    xhr = ($.get 'data/departments.json', {dataType: 'json'})
    xhr.done (data) ->
      displayDepartments method, data
    xhr.fail (res) ->
      displayError method, res.statusCode, res.statusText

  # Using getJSON()
  ($ '#fourth-button').click (e) ->
    method = 'getJSON()'
    xhr = ($.getJSON 'data/departments.json')
    xhr.done (data) ->
        displayDepartments method, data
    xhr.fail (res) ->
      displayError method, res.statusCode, res.statusText

  displayDepartments = (method, departments) ->
    ($ '#output').html departmentsTemplate
      method: method
      departments: departments

  displayError = (method, code, text) ->
    alert "#{method} failed: #{code} - #{text}"