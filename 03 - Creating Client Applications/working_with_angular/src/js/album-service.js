// Generated by CoffeeScript 1.6.2
(function() {
  var AlbumService;

  AlbumService = (function() {
    function AlbumService($http) {
      var urlBase;

      urlBase = '/data/images.json';
      AlbumService.prototype.get = function() {
        return ($http.get(urlBase)).then(function(results) {
          return results.data;
        });
      };
    }

    return AlbumService;

  })();

  app.service('albumService', ['$http', AlbumService]);

}).call(this);