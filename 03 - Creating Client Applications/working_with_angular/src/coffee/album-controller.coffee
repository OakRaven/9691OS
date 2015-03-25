class AlbumController
  constructor: ($scope, albumService) ->
    setAlbum = =>
      albumService.get().then (data) ->
        $scope.album = data

    setAlbum()

app.controller 'albumController', AlbumController