# Increment and decrement karma based on + and -
# 

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
  # old_val = robot.brain.data.karma[object] || 0
  old_val = 0
  if action == '++'
    new_val = old_val + 1
  else
    new_val = old_val - 1
  end
    
  msg.send robot.brain.data.karma
  return