PI = Math.PI
DegreesInRadians = 180 / PI
RadiansInGradian = 200 / PI

radiansToDegrees = (radians) ->
  return radians * DegreesInRadians

radiansToGradians = (radians) ->
  return radians * RadiansInGradian

degreesToRadians = (degrees) ->
  return degrees / DegreesInRadians

degreesToGradian = (degrees) ->
  radians = degreesToRadians degrees
  return (radiansToGradians radians)

gradiansToRadians = (gradians) ->
  return gradians / RadiansInGradian

gradiansToDegrees = (gradians) ->
  radians = gradiansToRadians gradians
  return (radiansToDegrees radians)

module.exports.angles =
  degreesToRadians: degreesToRadians
  degreesToGradian: degreesToGradian
  radiansToDegrees: radiansToDegrees
  radiansToGradians: radiansToGradians
  gradiansToDegrees: gradiansToDegrees
  gradiansToRadians: gradiansToRadians