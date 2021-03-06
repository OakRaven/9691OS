// Generated by CoffeeScript 1.6.2
(function() {
  $(function() {
    var galleryTemplate;

    galleryTemplate = _.template(($('#album-template')).html());
    return ($.getJSON('data/images.json')).done(function(data) {
      var galleryHtml;

      galleryHtml = galleryTemplate({
        album: data
      });
      return ($('#gallery')).append(galleryHtml);
    });
  });

}).call(this);
