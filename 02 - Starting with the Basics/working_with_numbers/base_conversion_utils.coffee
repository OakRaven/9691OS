convertBase = (number, fromBase, toBase) ->
  value = parseInt number, fromBase
  value.toString toBase

convertToBase2 = (number, fromBase = 10) ->
  convertBase number, fromBase, 2

convertToBase10 = (number, fromBase = 2) ->
  convertBase number, fromBase, 10

convertToBase16 = (number, fromBase = 10) ->
  convertBase number, fromBase, 16

module.exports =
  convertBase: convertBase
  convertToBase2: convertToBase2
  convertToBase10: convertToBase10
  convertToBase16: convertToBase16