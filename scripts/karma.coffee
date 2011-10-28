# Increment and decrement karma based on + and -
# 

Sys = require "sys"

module.exports = (robot) ->
  robot.hear /(\w*)(\+\+|\-\-)$/i, (msg) ->
    object = msg.match[1]
    action = msg.match[2]
    karma(robot, msg, object, action)

karma = (robot, msg, object, action) ->
  robot.brain.data.karma = {}
  msg.send "obj:" + object
  msg.send "act:" + action
  if object == 'adrianpike'
    action = '++'
  if (typeof(robot.brain.data.karma.object) !== 'undefined')
    old_val = robot.brain.data.karma.object
  else
    old_val = 0
  if action == '++'
    new_val = old_val + 1
  else
    new_val = old_val - 1
  robot.brain.data.karma.object = new_val
  msg.send Sys.inspect(robot.brain.data.karma)
  return