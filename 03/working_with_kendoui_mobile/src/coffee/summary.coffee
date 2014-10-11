window.app = window.app || {}

formatCurrency = (amt) ->
  kendo.toString amt, 'c'

viewShow = (e) ->
  aggregates = app.data.employeeDS.aggregates().salesYtd
  data = app.data.employeeDS.data().toJSON().sort (empA, empB) ->
    empB.salesYtd - empA.salesYtd

  best = data[0]
  worst = data[data.length - 1]

  summary =
    employeeCount: aggregates.count
    totalSalesYtd: formatCurrency aggregates.sum
    best: { name: "#{best.firstName} #{best.lastName}", salesYtd: formatCurrency best.salesYtd }
    worst: { name: "#{worst.firstName} #{worst.lastName}", salesYtd: formatCurrency worst.salesYtd }

  kendo.bind (e.view.element.find '#summary-listview'),
    summary, kendo.mobile.ui

window.app.summary =
  viewShow: viewShow