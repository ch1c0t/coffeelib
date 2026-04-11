"""
exports.run = ->
  [_node, _program, command] = process.argv

  switch command
    when 'help'
      { printHelp } = require './commands/help'
      printHelp()
    else
      { printHelp } = require './commands/help'
      printHelp()
"""
