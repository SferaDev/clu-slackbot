# Description:
#   Sleep/wake functionality to silence hubot (except when bothered)
#
# Dependencies:
#   underscore
#
# Configuration:
#   None
#
# Commands:
#   hubot sleep - puts hubot to sleep temporarily hubot wake - wakes hubot up
#
# Author:
#   qbunt
module.exports = (robot) ->
  asleep = false
  robot.respond /sleep/i, (msg) ->
    msg.send("zzzzz....zzzzzzzzzz")
    
    existing_listeners = robot.listeners;
    robot.listeners = []
    asleep = true
    robot.respond /wake/i, (msg) ->
      robot.listeners = existing_listeners
      msg.send("ಠ_ಠ AWAKE NOW")
      asleep = false
    
    robot.respond /.*/i, (msg) ->
      msg.send("screw off, I'm asleep") if asleep

