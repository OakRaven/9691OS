// Generated by CoffeeScript 1.7.1
(function() {
  var Client, URL, USERNAME, client, countries, countryCode, getCountryInfo, options, _i, _len;

  Client = require('node-rest-client').Client;

  options = {
    json: ['application/json;charset=UTF-8']
  };

  client = new Client(options);

  USERNAME = 'beingmikeh';

  URL = 'http://api.geonames.org/countryInfoJSON';

  getCountryInfo = function(countryCode) {
    var args;
    args = {
      parameters: {
        username: USERNAME,
        country: countryCode || ''
      }
    };
    return client.get(URL, args, function(data, resp) {
      debugger;
      return console.dir(data);
    });
  };

  countries = ['ca', 'us', 'gb'];

  for (_i = 0, _len = countries.length; _i < _len; _i++) {
    countryCode = countries[_i];
    getCountryInfo(countryCode);
  }

}).call(this);
