(function() {
  var CreateJasmine, CreateTmpDirectory, ResolvePathToCLI;

  ({CreateJasmine} = require('./CreateJasmine'));

  ({CreateTmpDirectory} = require('./CreateTmpDirectory'));

  ({ResolvePathToCLI} = require('./ResolvePathToCLI'));

  exports.CreateTestEnvironment = async function() {
    var cli, dir, jasmine;
    await Promise.resolve();
    dir = CreateTmpDirectory();
    jasmine = CreateJasmine();
    cli = ResolvePathToCLI();
    return {dir, jasmine, cli};
  };

}).call(this);
