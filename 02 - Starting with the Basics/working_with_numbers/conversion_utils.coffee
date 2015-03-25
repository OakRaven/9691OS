PI = Math.PI
DEGREES_IN_RADIAN = 180 / PI
RADIANS_IN_GRADIAN = 200 / PI

radiansToDegrees = (radians) ->
  radians * DEGREES_IN_RADIAN

radiansToGradians = (radians) ->
  radians * RADIANS_IN_GRADIAN

degreesToRadians = (degrees) ->
  degrees / DEGREES_IN_RADIAN

degreesToGradian = (degrees) ->
  radians = degreesToRadians degrees
  radiansToGradians radians

gradiansToRadians = (gradians) ->
  gradians / RADIANS_IN_GRADIAN

gradiansToDegrees = (gradians) ->
  radians = gradiansToRadians gradians
  radiansToDegrees radians

module.exports.angles =
  degreesToRadians: degreesToRadians
  degreesToGradian: degreesToGradian
  radiansToDegrees: radiansToDegrees
  radiansToGradians: radiansToGradians
  gradiansToDegrees: gradiansToDegrees
  gradiansToRadians: gradiansToRadians
