Client = require('node-rest-client').Client
config = require './service-config'

options =
  mimetypes:
    json: [
      'application/json;charset=UTF-8'
    ]

client = new Client(options)

USERNAME = config.username
URL = "#{config.rootUrl}/countryInfoJSON"

getCountryInfo = (countryCode) ->
  args =
    parameters:
      username: USERNAME
      country: (countryCode or '')


  client.get URL, args, (data, resp) ->
    result = data.geonames[0]
    console.log "Country  : #{result.countryName}"
    console.log "Capital  : #{result.capital}"
    console.log "Currency : #{result.currencyCode}"
    console.log "Area     : #{result.areaInSqKm} (sq km)"
    console.log "Continent: #{result.continentName}\n"

countries = ['ca', 'us', 'gb']
getCountryInfo(countryCode) for countryCode in countries
