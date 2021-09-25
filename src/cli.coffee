require '@ch1c0t/io'

global.CWD = process.cwd()
global.SRC = "#{CWD}/src"
global.LIB = "#{CWD}/lib"

{ create } = require './commands/create'
{ build } = require './commands/build'
{ watch } = require './commands/watch'

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

printHelp = ->
  console.log """
    A tool to create isomorphic libraries with CoffeeScript.

      new NAME            Create the directory named NAME and a new library inside of it.
      watch               Start a development session in the current directory.
      build               Build the project in the current directory.
      version             Print the version.
      help                Show this message.
  """
