(function() {
  var CreateJasmine, CreateTmpDirectory, ResolvePathToCLI;

  ({CreateJasmine} = require('./CreateJasmine'));

  ({CreateTmpDirectory} = require('./CreateTmpDirectory'));

  ({ResolvePathToCLI} = require('./ResolvePathToCLI'));

  exports.CreateTestEnvironment = async function() {
    await Promise.resolve();
    return {
      dir: CreateTmpDirectory(),
      jasmine: CreateJasmine(),
      cli: ResolvePathToCLI(),
      tasks: []
    };
  };

}).call(this);
