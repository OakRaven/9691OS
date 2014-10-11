fs =         require 'fs'
readline =   require 'readline'
stream =     require 'stream'
accounting = require 'accounting'
moment =     require 'moment'

spec = [
  { name: 'entry', start: 0, size: 8, type: 'string' }
  { name: 'period', start: 8, size: 4, type: 'integer' }
  { name: 'post_date', start: 12, size: 12, type: 'date' }
  { name: 'gl_account', start: 24, size: 13, type: 'string'}
  { name: 'description', start: 37, size: 27, type: 'string' }
  { name: 'source', start: 64, size: 5, type: 'string' }
  { name: 'cash_flow', start: 69, size: 4, type: 'boolean' }
  { name: 'reference', start: 73, size: 10, type: 'string' }
  { name: 'posted', start: 83, size: 5, type: 'boolean' }
  { name: 'debit', start: 88, size: 20, type: 'float' }
  { name: 'credit', start: 108, size: 20, type: 'float' }
  { name: 'allocated', start: 128, size: 4, type: 'boolean' }
]

config =
  dateFormat: 'MM/DD/YYYY'

parseLine = (line) ->
  item = {}

  extractSegment = (field) ->
    value = line.substr(field.start, field.size).trim()
    switch field.type
      when 'float', 'integer' then value = parseNumber value
      when 'date' then value = parseDate value
      when 'boolean' then value = parseBoolean value

    item[field.name] = value

  extractSegment(field) for field in spec

  return item

parseNumber = (value) ->
  return accounting.parse value

parseDate = (value) ->
  return moment(value, config.dateFormat).toDate()

parseBoolean = (value) ->
  return ['true', 'yes', 'on'].indexOf(value.toLowerCase()) >= 0

recordCount = 0
totalCredit = 0.00
totalDebit  = 0.00
minPostDate = moment('2100-01-01').toDate()
maxPostDate = moment('1900-01-01').toDate()

input = fs.createReadStream 'transactions.txt'
rl = readline.createInterface
  input: input
  output: null
  terminal: false

rl.on 'line', (line) ->
  record = parseLine line

  recordCount += 1
  totalDebit += record.debit
  totalCredit += record.credit
  minPostDate = record.post_date if record.post_date < minPostDate
  maxPostDate = record.post_date if record.post_date > maxPostDate

input.on 'end', ->
  console.log "\nBetween " +
    "#{moment(minPostDate).format(config.dateFormat)} and " +
    "#{moment(maxPostDate).format(config.dateFormat)}, " +
    "#{recordCount} records were processed.\n"

  console.log "Total DB: #{accounting.formatMoney(totalDebit)}"
  console.log "Total CR: #{accounting.formatMoney(totalCredit)}\n"