# Increment and decrement karma based on + and -
# 

module.exports = (robot) ->
  robot.hear /^(.*)(\+\+|\-\-)$/i, (msg) ->
    object = msg.match[1]
    action = msg.match[2]
    karma(msg, object, action)

karma = (msg, object, action) ->
  msg.send "obj:" + object
  msg.send "act:" + action
  return