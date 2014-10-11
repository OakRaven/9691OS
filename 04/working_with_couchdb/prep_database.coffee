cradle = require 'cradle'
db = (new(cradle.Connection)).database 'vehicles'
db.create()

db.save [
  { _id: 'car', type: 'Car', wheelCount: 4 }
  { _id: 'truck', type: 'Truck', wheelCount: 4 }
  { _id: 'bicycle', type: 'Bicycle', wheelCount: 2 }
  { _id: 'unicycle', type: 'Unicycle', wheelCount: 1 }
  { _id: 'tricycle', type: 'Tricycle', wheelCount: 3 }
  { _id: 'van', type: 'Van', wheelCount: 4 }
  { _id: 'motorcycle', type: 'Motorcycle', wheelCount: 2 }
  { _id: 'moped', type: 'Moped', wheelCount: 2 }
]