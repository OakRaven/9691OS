redis = require 'redis'
client = redis.createClient()

# initialize vistis to 0
client.set 'visits', 0

# increment visits
client.incr 'visits', redis.print
client.incr 'visits', redis.print

# decrement visits
client.decr 'visits', redis.print

# initialize vistis to 0
client.set 'visits', 13

# increment visits by 5
client.incrby 'visits', 5, redis.print
client.quit()
