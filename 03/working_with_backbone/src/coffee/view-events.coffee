Employee = window.app.models.Employee

class EditView extends Backbone.View
  template: _.template ($ '#employee-edit-template').html()

  events:
    'click #emp-edit button'    : 'updateEmployee'
    'mouseover #emp-edit label' : 'highlight'
    'mouseout  #emp-edit label' : 'unhighlight'

  updateEmployee: (e) ->
    id = ($ e.target).data 'id'
    alert "Update button has been clicked for ID: #{id}"

  highlight: (e) ->
    ($ e.target).addClass 'highlighted'

  unhighlight: (e) ->
    ($ e.target).removeClass 'highlighted'

  render: ->
    @$el.html(@template @model.toJSON())
    return this


emp = new Employee
  id: 1
  firstName: 'Tracy'
  lastName: 'Ouellette'
  salesYtd: 22000

editView = new EditView { model: emp }

($ '#emp-edit-container').html editView.render().el