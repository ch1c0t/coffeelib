(function() {
  exports.printHelp = function() {
    return console.log(`A tool to create isomorphic projects with CoffeeScript.

  new NAME [TEMPLATE]
    Create the directory named NAME and a new project inside of it.
    TEMPLATE determines what kind of project will be created.
      Omitting TEMPLATE, as in
        coffeelib new name
          creates a basic CoffeeScript library.
      Specifying TEMPLATE, as in
        coffeelib new name cli
          creates a CLI project.
  watch
    Start a development session in the current directory.
  build
    Build the project in the current directory.
  version
    Print the version.
  help
    Show this message.`);
  };

}).call(this);
