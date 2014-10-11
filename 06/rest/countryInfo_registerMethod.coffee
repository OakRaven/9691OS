Client = require('node-rest-client').Client

options =
  mimetypes:
    json: [
      'application/json;charset=UTF-8'
    ]

client = new Client(options)

USERNAME = 'beingmikeh'
URL = 'http://api.geonames.org/countryInfoJSON'

client.registerMethod 'getCountryInfo', URL, 'GET'

getCountryInfo = (countryCode) ->
  args =
    parameters:
      username: USERNAME
      country: (countryCode or '')

  client.methods.getCountryInfo args, (data, resp) ->
    result = data.geonames[0]
    console.log "Country  : #{result.countryName}"
    console.log "Capital  : #{result.capital}"
    console.log "Currency : #{result.currencyCode}"
    console.log "Area     : #{result.areaInSqKm} (sq km)"
    console.log "Continent: #{result.continentName}\n"

countries = ['ca', 'us', 'gb']
getCountryInfo(countryCode) for countryCode in countries