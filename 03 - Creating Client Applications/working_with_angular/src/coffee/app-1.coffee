app = angular.module 'albumApp', []

class AlbumController
  constructor: ($scope) ->
    $scope.album =
      title: "Berry Picking 2012"
      imageRootPath: "img/albums/berries-2012/"
      images: [
        { filename: "WP_001740.jpg", description: "Path to tranquility." }
        { filename: "WP_001745.jpg", description: "Vines on rocks." }
        { filename: "WP_001749.jpg", description: "Weathered tree stump." }
        { filename: "WP_001754.jpg", description: "A view to the marsh." }
        { filename: "WP_001755.jpg", description: "Rocks at the edge of the brook." }
        { filename: "WP_001757.jpg", description: "More rocks." }
        { filename: "WP_001763.jpg", description: "Sun sparkles in the stream." }
        { filename: "WP_001768.jpg", description: "Weathered bench." }
        { filename: "WP_001773.jpg", description: "This way to the Costly Farm Trail." }
      ]

app.controller 'albumController', AlbumController