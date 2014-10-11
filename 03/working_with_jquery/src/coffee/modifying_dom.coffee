$ ->
  # Add new todo
  ($ '#add-button').click (e) ->
    description = ($ '#todo-description').val()
    addTodoItem description

  # Delete an item
  ($ '#todo-list').on 'click', '.delete-button', (e) ->
    if (confirm 'Delete this item?')
      ($ e.target).parent('li').remove()

  # Mark an item complete
  ($ '#todo-list').on 'click', '.complete-checkbox', (e) ->
    ($ e.target).parent('label').toggleClass 'completed'

  # Pre-populate our list with some tasks
  (addTodoItem description) for description in ['Pick up milk',
    'Take the car in for an oil change',
    "Pick up tickets for Jenn's show"]

addTodoItem = (description) ->
  itemHtml = "<li class='list-group-item'>
      <label>
      <input type='checkbox' class='complete-checkbox'>
      #{description}
      </label>
      <button class='delete-button btn btn-danger btn-xs'>Delete</button>
    </li>"

  ($ '#todo-list').append itemHtml

