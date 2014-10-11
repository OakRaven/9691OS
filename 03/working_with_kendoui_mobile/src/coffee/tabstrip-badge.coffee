window.app = window.app || {}

viewInit = (e) ->
  footer = e.view.footer
  tabstrip = (footer.find '.km-tabstrip') \
    .data('kendoMobileTabStrip')
  tabstrip.badge 1, 5

  console.log (tabstrip.badge 1)

window.app.view =
  all:
    viewInit: viewInit