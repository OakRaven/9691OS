// Generated by CoffeeScript 1.6.2
(function() {
  var Album, Image, ImageCollection, displayAlbum, _ref, _ref1, _ref2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Image = (function(_super) {
    __extends(Image, _super);

    function Image() {
      _ref = Image.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Image.prototype.defaults = {
      filename: '',
      description: ''
    };

    Image.prototype.thumbnail = function() {
      return "tn_" + (this.get('filename'));
    };

    return Image;

  })(Backbone.Model);

  ImageCollection = (function(_super) {
    __extends(ImageCollection, _super);

    function ImageCollection() {
      _ref1 = ImageCollection.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    ImageCollection.prototype.model = Image;

    return ImageCollection;

  })(Backbone.Collection);

  Album = (function(_super) {
    __extends(Album, _super);

    function Album() {
      _ref2 = Album.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    Album.prototype.defaults = {
      title: '',
      imageRootPath: '',
      images: new ImageCollection()
    };

    return Album;

  })(Backbone.Model);

  displayAlbum = function(album) {
    var tmpl;

    tmpl = _.template(($('#album-template')).html());
    return ($('#album-container')).append(tmpl(album));
  };

  window.appAlbum = {
    models: {
      Album: Album,
      Image: Image,
      ImageCollection: ImageCollection
    },
    views: {},
    displayAlbum: displayAlbum
  };

}).call(this);
