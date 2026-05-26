exports.printHelp = ->
  console.log """
    A tool to create with CoffeeScript.

      new NAME [TEMPLATE]
        Create the directory named NAME and a new project inside of it.

        TEMPLATE determines what kind of project will be created.
          Omitting TEMPLATE, as in
            coffeelib new name
              creates a basic CoffeeScript library.
          Specifying TEMPLATE, as in
            coffeelib new name cli
            coffeelib new name rpc
              creates a CLI project or an RPC project.

        TEMPLATE could be either
          a name of a built-in template
            as shown in the examples above
          a filesystem path to an external template
            as in
              coffeelib new package_from_external_template /home/om/sources/coffee/coffeelib/spec/cli/new/external_template
      watch
        Start a development session in the current directory.
      build
        Build the project in the current directory.
      test
        Run the specs for the project in the current directory.
      version
        Print the version.
      help
        Show this message.
  """
