Client = require('node-rest-client').Client
config = require './service-config'

client = new Client config.options

url = "#{config.rootUrl}/countryInfoJSON"
client.registerMethod 'getCountryInfo', url, 'GET'

getCountryInfo = (countryCode, callback) ->
  args =
    parameters:
      username: config.username
      country: countryCode or ''

  req = client.methods.getCountryInfo args, (data, resp) ->
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
