# Increment and decrement karma based on + and -
# 

Sys = require "sys"

module.exports = (robot) ->
  robot.hear /karma (\w+)/, (msg) ->
    if msg.match[1]
      msg.send(robot.brain.data.karma[object])
    else
      msg.send(robot.brain.data.karma)
    end

  robot.hear /(\w*)(\+\+|\-\-)$/i, (msg) ->
    object = msg.match[1]
    action = msg.match[2]
    if object
      karma(robot, msg, object, action)

karma = (robot, msg, object, action) ->
  if typeof(robot.brain.data.karma) is 'undefined'
    robot.brain.data.karma = {}
  if object == 'adrianpike'
    action = '++'
  if typeof(robot.brain.data.karma[object]) != 'undefined'
    old_val = robot.brain.data.karma[object]
  else
    old_val = 0
  if action == '++'
    new_val = old_val + 1
  else
    new_val = old_val - 1
  robot.brain.data.karma[object] = new_val
  msg.send object + "'s karma is now " + new_val
  return