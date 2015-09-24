# Description:
#   Send messages to your co-workers from another chat room as Hubot
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot troll <room> with <message> - <message>
#
# Author:
#   brandonjmckay

module.exports = (robot) ->
  robot.respond /(?:sudo) (.*) with ?(.*)/i, (msg) ->
    msg.send "Tee hee... They've been trolled! You're a terrible person..."
    robot.messageRoom msg.match[1], msg.match[2]
