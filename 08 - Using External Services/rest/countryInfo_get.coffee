Client = require('node-rest-client').Client
config = require './service-config'

client = new Client config.options

getCountryInfo = (countryCode, callback) ->
  url = "#{config.rootUrl}/countryInfoJSON"
  args =
    parameters:
      username: config.username
      country: countryCode or ''

  req = client.get url, args, (data, resp) ->
    if data.geonames
      callback null, data.geonames[0]
    else
      callback "No data returned for #{countryCode}"

  req.on 'error', (err) ->
    callback err.request.options

countries = ['ca', 'us', 'gb']
for countryCode in countries
  getCountryInfo countryCode, (err, result) ->
    if err
      console.log 'Error', err
    else
      console.log "Country  : #{result.countryName}"
      console.log "Capital  : #{result.capital}"
      console.log "Currency : #{result.currencyCode}"
      console.log "Area     : #{result.areaInSqKm} (sq km)"
      console.log "Continent: #{result.continentName}\n"
