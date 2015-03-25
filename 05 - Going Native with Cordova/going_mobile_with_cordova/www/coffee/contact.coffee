$contactStatus = ($ '#contact-status')
$contactError =  ($ '#contact-error')
$contactInfo =   ($ '#contact-info')

onFetchContacts = ->
  addContact = (contact) ->
    if contact.displayName
      $contactInfo.append "<li>#{contact.displayName}</li>"

  onSuccess = (contacts) ->
    $contactStatus.hide()
    $contactInfo.empty()
    (addContact item) for item in contacts
    $contactInfo.show()

  onError = (err) ->
    $contactStatus.hide()

    errorMessage = "<h4>Error: #{err.code}</h4><p>#{err.message}</p>"
    $contactError.html errorMessage
    $contactError.show()

  $contactStatus.show()
  fields = ['displayName']
  findOptions =
    filter: ''
    multiple: true

  navigator.contacts.find fields, onSuccess, onError, findOptions

onAddContact = ->
  try
    contact = navigator.contacts.create
      displayName:  'M. W. Hatfield'
      nickname:     'Mike'
      name:
        givenName:  'Michael'
        familyName: 'Hatfield'

    contact.save()
    alert 'Contact has been saved'

  catch err
    alert "Error saving contact: #{err}"

app.demos.contacts =
  onFetchContacts: onFetchContacts
  onAddContact:    onAddContact