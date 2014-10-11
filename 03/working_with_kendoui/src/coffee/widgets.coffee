departmentsDatasource = null
employeesDataSource = null
imageDataSource = null

$ ->
  configureDataSources()

  ($ '#progressbar').kendoProgressBar value: 50

  ($ '#slider').kendoSlider max: 100, value: 50, change: ->
    ($ '#slider-value').text @value()
    progressBar = ($ '#progressbar').data('kendoProgressBar')
    progressBar.value @value()

  ($ '#datepicker').kendoDatePicker
    change: ->
      ($ '#datepicker-value').text @value()

  ($ '#datetimepicker').kendoDateTimePicker
    change: ->
      ($ '#datetimepicker-value').text @value()

  ($ '#dropdownlist').kendoDropDownList
    dataSource: departmentsDatasource
    optionLabel: 'Select...'
    change: ->
      ($ '#dropdownlist-value').text @value()

  ($ '#autocomplete').kendoAutoComplete
    dataSource: departmentsDatasource
    filter: "contains"
    change: ->
      ($ '#autocomplete-value').text @value()

  ($ '#grid').kendoGrid
    dataSource: employeesDataSource
    sortable: true
    groupable: true
    filterable: true
    selectable: true
    columns: [
      { field: 'id', title: 'ID' }
      { field: 'firstName', title: 'First name'}
      { field: 'lastName', title: 'Last name'}
      {
        field: 'salesYtd'
        title: 'Sales YTD'
        format: '{0:c}'
        attributes: style: 'text-align: right;'
        headerAttributes: style: 'text-align: right;'
      }
    ]
    change: ->
      employee = (@dataItem @select()[0])
      display = "#{employee.firstName} #{employee.lastName}"
      ($ '#grid-value').text display

  ($ '#listview').kendoListView
    dataSource: imageDataSource
    template: kendo.template ($ '#album-template').html()
    selectable: true
    change: ->
      selectedIndex = @select().index()
      image = @dataSource.view()[selectedIndex]
      ($ '#listview-value').text image.description


configureDataSources = ->
  departmentsDatasource = new kendo.data.DataSource
    transport:
      read:
        url: 'data/departments.json'
        dataType: 'json'
    sort:
      dir: 'asc'

  employeesDataSource = new kendo.data.DataSource
    transport:
      read:
        url: 'data/employees.json'
        dataType: 'json'

  imageDataSource = new kendo.data.DataSource
    transport:
      read:
        url: 'data/images.json'
        dataType: 'json'
    schema:
      data: (data) ->
        return data.images

updateProgressBar = (value) ->

