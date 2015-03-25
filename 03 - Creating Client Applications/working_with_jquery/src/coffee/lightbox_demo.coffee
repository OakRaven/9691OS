$ ->
  # Grab gallery template
  galleryTemplate = _.template ($ '#album-template').html()

  # Load images
  ($.getJSON 'data/images.json').done (data) ->
    # Render gallery template and append the HTML
    galleryHtml = galleryTemplate {album: data}
    ($ '#gallery').append galleryHtml
