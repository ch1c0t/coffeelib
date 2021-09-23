require '@ch1c0t/io'

{ create } = require './commands/create'

exports.run = ->
  [_node, _program, command] = process.argv

  switch command
    when 'new'
      name = process.argv[3]
      create name
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
      version             Print the version.
      help                Show this message.
  """
