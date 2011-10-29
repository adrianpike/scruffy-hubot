markov_lib = require('markov')
markov = markov_lib()

module.exports = (robot) ->
  robot.hear /(.+)/i, (msg) ->
    if /^markov/i.exec(msg.match[1])
      return
    else
      msg.send '-seeding ' + msg.match[1]
      markov.seed msg.match[1]

  robot.hear /markov (\w+)/, (msg) ->
    msg.send '-responding to ' + msg.match[1]
    msg.send(markov.respond(msg.match[1], 1)[0])

