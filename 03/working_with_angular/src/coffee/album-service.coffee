class AlbumService
  constructor: ($http) ->
    urlBase = '/data/images.json'
    AlbumService::get = ->
      ($http.get urlBase).then (results) ->
        results.data

app.service 'albumService', ['$http', AlbumService]