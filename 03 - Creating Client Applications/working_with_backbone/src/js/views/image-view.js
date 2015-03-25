// Generated by CoffeeScript 1.6.2
(function() {
  var ImageView;

  ImageView = Backbone.View.extend({
    tagName: 'a',
    template: _.template(($('#image-template')).html()),
    render: function() {
      this.$el.html($(this.template(this.model)));
      this.$el.attr({
        'data-lightbox': this.model.title,
        href: "" + this.model.imageRootPath + this.model.filename,
        title: this.model.description
      });
      return this;
    }
  });

  appAlbum.views.ImageView = ImageView;

}).call(this);