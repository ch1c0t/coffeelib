require '@ch1c0t/io'

global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

exports.run = ->
  [_node, _program, command] = process.argv

  switch command
    when 'new'
      { create } = require './commands/create'
      name = process.argv[3]
      create name
    when 'watch'
      { watch } = require './commands/watch'
      watch()
    when 'build'
      { build } = require './commands/build'
      build()
    when 'version'
      { version } = require '../package.json'
      console.log version
    when 'help'
      { printHelp } = require './commands/help'
      printHelp()
    else
      { printHelp } = require './commands/help'
      printHelp()
