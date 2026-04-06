exports.printHelp = ->
  console.log """
    A tool to create isomorphic libraries with CoffeeScript.

      new NAME            Create the directory named NAME and a new library inside of it.
      watch               Start a development session in the current directory.
      build               Build the project in the current directory.
      version             Print the version.
      help                Show this message.
  """
