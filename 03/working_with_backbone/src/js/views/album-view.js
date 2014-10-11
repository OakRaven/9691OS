// Generated by CoffeeScript 1.6.2
(function() {
  var AlbumView, views;

  views = appAlbum.views;

  AlbumView = Backbone.View.extend({
    tagName: 'div',
    template: _.template(($('#album-template')).html()),
    initialize: function() {
      _.bindAll(this, 'render');
      this.model.bind('change', this.render);
      return (this.model.get('images')).on('add', this.render, this);
    },
    render: function() {
      var album,
        _this = this;

      this.$el.html(this.template(this.model.toJSON()));
      album = this.model;
      (album.get('images')).forEach(function(img) {
        var imageHtml, imgView;

        imgView = new views.ImageView({
          model: {
            title: album.get('title'),
            imageRootPath: album.get('imageRootPath'),
            filename: img.get('filename'),
            description: img.get('description')
          }
        });
        imageHtml = imgView.render().el;
        return _this.$el.find('.well').append(imageHtml);
      });
      return this;
    }
  });

  views.AlbumView = AlbumView;

}).call(this);
