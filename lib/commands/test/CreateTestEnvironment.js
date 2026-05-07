(function() {
  var CreateJasmine, CreateTmpDirectory, ResolvePathToCLI, StartTasks;

  ({CreateJasmine} = require('./CreateJasmine'));

  ({CreateTmpDirectory} = require('./CreateTmpDirectory'));

  ({ResolvePathToCLI} = require('./ResolvePathToCLI'));

  ({StartTasks} = require('./StartTasks'));

  exports.CreateTestEnvironment = async function() {
    var dir;
    dir = CreateTmpDirectory();
    return {
      dir,
      jasmine: CreateJasmine(),
      cli: ResolvePathToCLI(),
      tasks: (await StartTasks({
        inside_of: dir
      }))
    };
  };

}).call(this);
