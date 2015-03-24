(function() {
  var app, cool, express;

  express = require('express');

  cool = require('cool-ascii-faces');

  app = express();

  app.set('port', process.env.PORT || 5000);

  app.set('views', __dirname + '/../views');

  app.set('view engine', 'jade');

  app.use(express["static"](__dirname + '/../public'));

  app.get('/', function(req, res) {
    var faces, times, _i;
    faces = [];
    times = process.env.TIMES || 5;
    for (_i = 0; 0 <= times ? _i < times : _i > times; 0 <= times ? _i++ : _i--) {
      faces.push(cool());
    }
    return res.render('index', {
      title: 'Home',
      faces: faces
    });
  });

  app.listen(app.get('port'), function() {
    return console.log("Node app is running at localhost:" + app.get('port'));
  });

}).call(this);
