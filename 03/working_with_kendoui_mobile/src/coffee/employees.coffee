window.app = window.app || {}

navigateToEmployee = (uid) ->
  kendo.mobile.application.navigate "#detailview?uid=#{uid}"

navigate = (e) ->
  itemUid = ($ e.touch.currentTarget).data 'uid'
  navigateToEmployee itemUid

swipe = (e) ->
  button = kendo.fx ($ e.touch.currentTarget).find('[data-role=button]')
  button.expand().duration(200).play()

touchstart = (e) ->
  target = ($ e.touch.initialTouch)
  listview = ($ '#listview').data 'kendoMobileListView'
  button = ($ e.touch.target).find('[data-role=button]:visible')

  if (target.closest '[data-role=button]')[0]
    model = app.data.employeeDS.getByUid ($ e.touch.target).attr('data-uid')
    app.data.employeeDS.remove(model)
    @events.cancel()
    e.event.stopPropagation()
  else if button[0]
    button.hide()
    @events.cancel()
  else
    listview.items().find('[data-role=button]:visible').hide()

viewInit = (e) ->
  view = e.view
  (view.element.find '#listview').kendoMobileListView(
    dataSource: app.data.employeeDS
    template: ($ '#employeeItemTemplate').html()
  ).kendoTouch(
    filter: '>li'
    enableSwipe: true
    touchstart: touchstart
    tap: navigate
    swipe: swipe
  )

  (view.element.find '#add').bind 'click', (e) ->
    e.preventDefault()
    app.data.employeeDS.add { firstName: '', lastName: '', salesYtd: 0.00 }
    data = app.data.employeeDS.data()
    lastItem = data[data.length - 1]
    navigateToEmployee lastItem.uid

viewShow = (e) ->
  app.data.employeeDS.sort { field: 'firstName', dir: 'asc' }
  ($ '#listview').data('kendoMobileListView').refresh()

editViewInit = (e) ->
  view = e.view

  (view.element.find '#done').data('kendoMobileButton').bind 'click', (e) ->
    e.preventDefault()
    kendo.mobile.application.navigate '#app-employees'

  (view.element.find '#cancel').data('kendoMobileBackButton').bind 'click', (e) ->
    e.preventDefault();
    app.data.employeeDS.cancelChanges()
    kendo.mobile.application.navigate '#app-employees'

editViewShow = (e) ->
  model = app.data.employeeDS.getByUid e.view.params.uid
  kendo.bind e.view.element, model, kendo.mobile.ui
  ($ '#detailview form input')[0].focus()

app.employees =
  viewInit: viewInit
  viewShow: viewShow
  editViewInit: editViewInit
  editViewShow: editViewShow