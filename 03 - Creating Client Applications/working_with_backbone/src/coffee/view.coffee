Employee = app.models.Employee

class EmployeeView extends Backbone.View
  tagName: 'tr'
  template: _.template ($ '#employee-template').html()
  render: ->
    @$el.html ($ (@template @model.toJSON()))
    return this

class EmployeeListView extends Backbone.View
  render: ->
    _.each @model.models, (emp) =>
      ev = new EmployeeView { model: emp }
      @$el.append ev.render().$el

window.app.views.EmployeeView = EmployeeView
window.app.views.EmployeeListView = EmployeeListView
