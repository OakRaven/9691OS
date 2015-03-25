data = require './sample_data'
math = (require './collection_math_utils').numeric


console.log "Sum of scores:   ", (math.sum data.testScores)
console.log "Highest score:   ", (math.max data.testScores)
console.log "Lowest score:    ", (math.min data.testScores)
console.log "Average score:   ", (math.avg data.testScores)
console.log "Median score:    ", (math.median data.testScores)
console.log "Mid range score: ", (math.midRange data.testScores)
console.log "Mode of scores:  ", (math.mode data.testScores)
console.log "Variation of scores: ", (math.variation data.testScores)
console.log "Deviation of scores: ", (math.deviation data.testScores)