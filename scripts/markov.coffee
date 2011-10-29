markov_lib = require('markov')
markov = markov()

module.exports = (robot) ->
  robot.hear /(.+)/i, (msg) ->
    msg.send('-seeding ' + msg.match[1])
    markov.seed msg.match[1]

  robot.hear /markov (\w+)/, (msg) ->
    msg.send('-responding to ' + msg.match[1])
    msg.send(markov.respond(msg.match[1], 1)[0])

