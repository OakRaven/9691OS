$ ->
  employeesDataSource = new kendo.data.DataSource
    transport:
      read:
        url: 'data/employees.json'
        dataType: 'json'
    sort:
      field: 'salesYtd'
      dir: 'desc'

  ($ '#bar-graph').kendoChart
    dataSource: employeesDataSource
    title:
      text: 'YTD Sales by Employee'
    legend:
      visible: false
    seriesDefaults:
      type: 'bar'
      labels:
        visible: true
        format: '{0:c}'
    series: [
      name: 'YTD'
      field: 'salesYtd'
    ]
    categoryAxis:
      field: 'firstName'

  ($ '#area-graph').kendoChart
    dataSource: employeesDataSource
    title:
      text: 'YTD Sales by Employee'
    legend:
      visible: false
    seriesDefaults:
      type: 'area'
      labels:
        visible: true
        format: '{0:c}'
    series: [
      name: 'YTD'
      field: 'salesYtd'
    ]
    categoryAxis:
      field: 'firstName'

  ($ '#line-graph').kendoChart
    dataSource: employeesDataSource
    title:
      text: 'YTD Sales by Employee'
    legend:
      visible: false
    seriesDefaults:
      type: 'line'
      labels:
        visible: true
        format: '{0:c}'
    series: [
        name: 'YTD'
        field: 'salesYtd'
    ]
    categoryAxis:
      field: 'firstName'


  ($ '#pie-graph').kendoChart
    dataSource: employeesDataSource
    title:
      text: 'YTD Sales by Employee'
    legend:
      position: 'right'
    seriesDefaults:
      type: 'pie'
      labels:
        visible: true
        format: '{0:c}'
    series:[
      categoryField: 'firstName'
      field: 'salesYtd'
    ]

  ($ '#linerguage').kendoLinearGauge
    pointer:
      value: 45
    scale:
      max: 100
      vertical: false

  ($ '#radialguage').kendoRadialGauge
    pointer:
      value: 45

  ($ '#qrcode').kendoQRCode
    value: 'http://coffeescript.org'