moment = require 'moment'

date = { year: 2014, month: 11, day: 15, hour: 15 }

# date as 2014-12-15 15:00
console.log moment(date).format('YYYY-MM-DD HH:mm')

# date as Monday, December 15th at 3 PM
console.log moment(date).format('dddd, MMMM Do [at] h A')

# set locale to FR
moment.locale 'FR'
console.log moment(date).format('LL')

# set locale to ES
moment.locale 'ES'
console.log moment(date).format('LL')

# set locale to ZH
moment.locale 'ZH-CN'
console.log moment(date).format('LL')