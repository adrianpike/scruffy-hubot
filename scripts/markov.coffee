markov_lib = require('markov')
markov = markov_lib()

module.exports = (robot) ->
  robot.hear /(.+)/i, (msg) ->
    markov.seed msg.match[1]

  robot.hear /markov (\w+)/, (msg) ->
    msg.send(markov.respond(msg.match[1], 1)[0])

