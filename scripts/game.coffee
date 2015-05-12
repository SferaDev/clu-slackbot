# Description:
#   scissor stone paper
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot lets play <scissor,stone,paper> -- play against clu
#
# Author:
#   jumoog

module.exports = (robot) ->
robot.respond /(lets play)( wapon )?(.*)/i, (msg)->
  userChoice = msg.match[3]
  computerChoice = Math.random()
  if computerChoice < 0.34
    computerChoice = "rock"
  else if computerChoice <= 0.67
    computerChoice = "paper"
  else
    computerChoice = "scissors"
  compare = (choice1, choice2) ->
    msg.send "The result is a tie!"  if choice1 is choice2
    if choice1 is "rock"
      if choice2 is "scissors"
        msg.send "rock wins"
      else
        msg.send "paper wins"
    if choice1 is "paper"
      if choice2 is "rock"
        msg.send "paper wins"
      else
        msg.send "scissors wins"  if choice2 is "scissors"
      if choice1 is "scissors"
        if choice2 is "rock"
          msg.send "rock wins"
        else
          msg.send "scissors wins"  if choice2 is "paper"

  msg.send "User Choice: " + userChoice
  msg.send "Computer Choice: " + computerChoice
  compare userChoice, computerChoice
