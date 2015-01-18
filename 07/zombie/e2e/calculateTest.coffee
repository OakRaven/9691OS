Browser = require 'zombie'
assert = require 'assert'

describe 'calculator page', ->
  before ->
    @browser = new Browser site: 'http://localhost:8080/'

  before ->
    @browser.visit '/index.html'

  it 'should load the calculator page', ->
    assert.equal @browser.text('h1'), 'Calculator App'

  it 'should add two numbers', ->
    @browser.fill '#firstValue', '4'
    @browser.fill '#secondValue', '5'
    @browser.pressButton '#calculateButton', =>
      assert.equal @browser.text('div#answer'), 'Answer: 9'
