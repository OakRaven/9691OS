DEPARTMENTS = [
  'Sales', 'Customer Service', 'I.T.'
  'Finance', 'Marketing', 'Human Resources'
  'Research and Development'
]

imageDataSource = new kendo.data.DataSource
  transport:
    read:
      url: 'data/gallery.json'
      dataType: 'json'
  schema:
    data: (data) ->
      return data.images

$ ->
  progressBar = $('#progressbar')
    .kendoProgressBar value: 50
    .data 'kendoProgressBar'

  $('#slider').kendoSlider
    max: 100, value: 50
    change: ->
      $('#slider-value').text @value()
      progressBar.value @value()

  $('#datepicker').kendoDatePicker
    change: ->
      $('#datepicker-value').text  @value()

  $('#datetimepicker').kendoDateTimePicker
    change: ->
      $('#datetimepicker-value').text @value()

  $('#dropdownlist').kendoDropDownList
    dataSource:
      data: DEPARTMENTS
      sort:
        dir: 'asc'
    optionLabel: 'Select...'
    change: ->
      $('#dropdownlist-value').text @value()

$('#autocomplete').kendoAutoComplete
  dataSource:
    data: DEPARTMENTS
    sort:
      dir: 'asc'
  filter: 'contains'
  change: ->
    $('#autocomplete-value').text @value()

$('#listview').kendoListView
  dataSource: imageDataSource
  template: kendo.template $('#album-template').html()
  selectable: true
  change: ->
    selectedIndex = @select().index()
    image = @dataSource.view()[selectedIndex]
    $('#listview-value').text image.description
