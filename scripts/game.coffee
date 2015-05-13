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

 compare = (userSelection, computerSelection) ->
   if userSelection == undefined
     return 'Please, select an option before play'
   if userSelection == computerSelection
     return 'It is a draw!'
   if userSelection == 'stone'
     if computerSelection == 'scissor'
       return 'You win.'
     else
       return 'The computer win. Try again.'
   else if userSelection == 'paper'
     if computerSelection == 'stone'
       return 'You win.'
     else if 'scissor'
       return 'The computer win. Try again.'
   else if userSelection == 'scissor'
     if computerSelection == 'stone'
       return 'The computer win. Try again.'
     else
       return 'You win.'
   return

 module.exports = (robot) ->
   robot.respond /(lets play)( wapon )?(.*)/i, (msg)->
     userChoice = msg.match[3]
     computerOption = Math.random()
     if computerOption < 0.34
       computerOption = 'stone'
     else if computerOption <= 0.67
       computerOption = 'paper'
     else
       computerOption = 'scissor'
     msg.send = compare(userChoice, computerOption)
