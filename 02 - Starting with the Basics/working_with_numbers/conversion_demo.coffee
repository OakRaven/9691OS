convUtils = require './conversion_utils'

console.log '360 deg:',
  "#{convUtils.angles.degreesToRadians 360} rad"
console.log '360 deg:',
  "#{convUtils.angles.degreesToGradian 360} grad"
console.log '6.28 rad:',
  "#{convUtils.angles.radiansToDegrees 6.28} deg"
console.log '6.28 rad:',
  "#{convUtils.angles.radiansToGradians 6.28} grad"
console.log '400 grad:',
  "#{convUtils.angles.gradiansToDegrees 400} deg"
console.log '400 grad:',
  "#{convUtils.angles.gradiansToRadians 400} rad"
