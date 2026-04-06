require '@ch1c0t/io'

global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

{ create } = require './commands/create'
{ build } = require './commands/build'
{ watch } = require './commands/watch'
{ printHelp } = require './commands/help'

exports.run = ->
  [_node, _program, command] = process.argv

  switch command
    when 'new'
      name = process.argv[3]
      create name
    when 'watch'
      watch()
    when 'build'
      build()
    when 'version'
      { version } = require '../package.json'
      console.log version
    when 'help'
      printHelp()
    else
      printHelp()
