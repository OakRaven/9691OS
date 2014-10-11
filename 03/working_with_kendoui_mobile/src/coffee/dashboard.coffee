window.app = window.app || {}

chartType = 'column'

emToPx = (value) ->
  emSize = parseFloat ($ 'body').css('font-size')
  emSize * value

buildChart = (type) ->
  chartType = type if type?
  app.data.employeeDS.sort { field: 'salesYtd', dir: 'desc' }
  ($ '#salesYtd').kendoChart
    dataSource: app.data.employeeDS
    title:
      text: 'YTD Sales'
    legend:
      position: 'bottom'
    chartArea:
      margin: emToPx(1)
    seriesDefaults:
      labels:
        visible: true
        format: '{0:c}'
    series: [
      type: chartType
      field: 'salesYtd'
    ]
    categoryAxis:
      field: 'firstName'

showBar = ->
  buildChart 'column'

showLine = ->
  buildChart 'line'

showArea = ->
  buildChart 'area'

viewShow = ->
  buildChart()

window.app.dashboard =
  viewShow: viewShow
  showBar: showBar
  showLine: showLine
  showArea: showArea