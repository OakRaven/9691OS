class window.App
  constructor: ->
    @calculator = new Calculator()

    $('button#calculateButton').click =>
      @calculate()

  firstValue: ->
    parseInt $('input#firstValue').val()

  secondValue: ->
    parseInt $('input#secondValue').val()

  displayResult: (result) ->
    $('div#answer').text "Answer: #{result}"

  calculate: ->
    result = @calculator.add @firstValue(), @secondValue()
    @displayResult result